install: install/deps install/neovim install/set-python install/lazygit
	nvim --headless +PlugInstall +qa

install/neovim:
	mkdir -p ~/Downloads
	cd ~/Downloads && \
		wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && \
		chmod u+x nvim.appimage && \
		./nvim.appimage --appimage-extract && \
		sudo mv squashfs-root / && \
		sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

install/deps: install/node install/plug
	sudo apt install fzy ripgrep fd-find git python3-pip && \
	sudo npm install -g neovim && \
	sudo pip3 install pipenv && \
	pipenv sync

install/node:
	curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
		sudo apt-get install -y nodejs

install/plug:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
	    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

install/set-python:
	echo "let g:python3_host_prog = '$(pipenv run which python)'" >> ./init.vim

install/lazygit:
	cd ~/Downloads && \
		LAZYGIT_VERSION=$$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') && \
		curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_$${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
		tar xf lazygit.tar.gz lazygit && \
		sudo install lazygit /usr/local/bin && \
		echo "alias lg='lazygit'" >> ~/.bashrc
