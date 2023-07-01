install:
	sudo apt install fzy neovim ripgrep fd-find git nodejs npm
	sudo npm install -f neovim
	curl -fLo .local/share/nvim/site/autoload/plug.vim \
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	sudo apt install python3-pip
	pip3 install pipenv
	pipenv sync
	echo "let g:python3_host_prog = '$(pipenv run which python)'" >> ./init.vim
	nvim --headless +PlugInstall +qa
	nvim --headless +"call coc#util#install_extension(['-sync'] + g:coc_global_extensions)"
