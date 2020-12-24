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
        if [[ ! -f Miniconda-latest-Linux-x86_64.sh ]]; then
            wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda-latest-Linux-x86_64.sh 
        fi 
        bash Miniconda-latest-Linux-x86_64.sh
        which conda

    else
        #echo "$(which conda)"
        echo "conda installed"
        which conda
    fi
}

install_zsh
#install_conda
