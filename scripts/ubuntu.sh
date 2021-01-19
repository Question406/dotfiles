# install zsh
install_zsh(){
    if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
        echo "zsh installed"
        # Set the default shell to zsh if it isn't currently set to zsh
        if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
            chsh -s $(which zsh)
        fi
    else
        echo "installing ZSH"
        apt install zsh
        install_zsh
    fi
}

# install conda
install_conda(){
    if [[ -z "$(which conda)" ]]; then 
        #if [ "$choice" = ]
        #read -p "install conda or not(y/n)" 
        echo "installing conda"
        # download sh
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
        # install to ~/.miniconda
        bash miniconda.sh -b -p $HOME/.miniconda
        # delete miniconda installation sh file
        rm miniconda.sh
        which conda

    else
        #echo "$(which conda)"
        echo "conda installed"
        which conda
    fi
}

install_zsh
install_conda
