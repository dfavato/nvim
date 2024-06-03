default: lazygit.checkpoint nvim ~/.gitconfig ~/.ssh/config

apt.checkpoint: /etc/apt/sources.list.d/github-cli.list
	sudo apt update
	touch apt.checkpoint

/usr/bin/cmake: apt.checkpoint
	sudo apt install cmake -y
	sudo touch /usr/bin/cmake

/usr/bin/pipx: apt.checkpoint
	sudo apt install --user pipx
	sudo pipx ensurepath

~/.local/bin/ansible: /usr/bin/pipx
	pipx install --include-deps ansible
	pipx inject --include-apps ansible argcomplete

nvim.appimage: /usr/bin/wget
	wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && \
	chmod u+x nvim.appimage

squashfs-root/: nvim.appimage
	./nvim.appimage --appimage-extract

/squashfs-root/: squashfs-root/
	sudo cp -r squashfs-root /

/usr/bin/nvim: /squashfs-root/
	sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

~/.local/share/nvim/site/autoload/plug.vim: /usr/bin/nvim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
	    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

/usr/bin/node: apt.checkpoint
	curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
		sudo apt-get install -y nodejs
	sudo touch /usr/bin/node

/usr/bin/pip3: apt.checkpoint
	sudo apt install python3-pip -y
	sudo touch /usr/bin/pip3

/usr/local/bin/pipenv: /usr/bin/pip3
	pip3 install pipenv --user
	sudo touch /usr/local/bin/pipenv

/usr/bin/fzy: apt.checkpoint
	sudo apt install fzy -y
	sudo touch /usr/bin/fzy

/usr/bin/ripgrep: apt.checkpoint
	sudo apt install ripgrep -y
	sudo touch /usr/bin/ripgrep

/usr/bin/fdfind: apt.checkpoint
	sudo apt install fd-find -y
	sudo touch /usr/bin/fdfind

/usr/bin/git: apt.checkpoint
	sudo apt install git -y
	sudo touch /usr/bin/git

.venv/: /usr/local/bin/pipenv
	pipenv sync

/usr/lib/node_modules/neovim/: /usr/bin/node
	sudo npm install -g neovim

nvim.checkpoint: ~/.local/share/nvim/site/autoload/plug.vim /usr/bin/nvim \
	/usr/lib/node_modules/neovim/ .venv/ /usr/bin/fdfind /usr/bin/ripgrep \
	/usr/bin/fzy /usr/bin/git /usr/bin/gh /usr/bin/tree-sitter \
	/usr/bin/cmake
	nvim --headless +PlugInstall +qa
	touch nvim.checkpoint

nvim: nvim.checkpoint

lazygit.tar.gz:
	LAZYGIT_VERSION=$$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') && \
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_$${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

lazygit: lazygit.tar.gz
	tar xf lazygit.tar.gz lazygit
	touch $@

/usr/local/bin/lazygit: lazygit
	sudo install lazygit /usr/local/bin/lazygit

lazygit.checkpoint: /usr/local/bin/lazygit ~/.config/lazygit/config.yml
	touch lazygit.checkpoint
	@echo "Lazygit installed!!"

/etc/apt/keyrings/:
	sudo mkdir -p -m 755 /etc/apt/keyrings

/usr/bin/wget:
	sudo apt-get install wget -y

/etc/apt/keyrings/githubcli-archive-keyring.gpg: /usr/bin/wget /etc/apt/keyrings/
	wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
	sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg

/etc/apt/sources.list.d/github-cli.list: /etc/apt/keyrings/githubcli-archive-keyring.gpg
	echo "deb [arch=$$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

/usr/bin/gh: apt.checkpoint
	sudo apt install gh -y
	sudo touch /usr/bin/gh

/usr/bin/tree-sitter: /usr/bin/node
	sudo npm install -g tree-sitter-cli

~/.gitconfig:
	ln -s $(PWD)/.gitconfig ~/.gitconfig

~/.ssh/:
	mkdir -p ~/.ssh

~/.ssh/config: ~/.ssh/
	ln -s $(PWD)/.ssh/config ~/.ssh/config

~/.config/lazygit/:
	mkdir -p ~/.config/lazygit

~/.config/lazygit/config.yml: ~/.config/lazygit/
	ln -s $(PWD)/.config/lazygit/config.yml ~/.config/lazygit/config.yml

clean/lazygit:
	-rm lazygit.tar.gz
	-rm lazygit
	-sudo rm /usr/local/bin/lazygit
	-rm lazygit.checkpoint
	-rm -rf ~/.config/lazygit

clean/nvim:
	-rm -rf squashfs-root
	-rm nvim.appimage
	-sudo rm -rf /squashfs-root
	-sudo rm -rf /usr/bin/nvim
	-rm nvim.checkpoint
	-rm -rf ~/.local/share/nvim
	-rm -rf .venv/

clean: clean/nvim clean/lazygit
	-rm *.checkpoint
	-rm ~/.gitconfig
