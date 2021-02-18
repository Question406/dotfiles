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
        sudo apt -y install zsh
        install_zsh
    fi
}

# real work
bash scripts/common.sh
install_zsh
sudo apt -y install nodejs
