# set -E bash
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

# install nodejs npm, for coc.nvim lsp
install_nodejs(){
    if [ node -v >/dev/null 2>&1 || npm -v >/dev/null 2>&1 ]; then
        echo "Installed nodejs"
        type node
    else
        echo "Installing nodejs"
        curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
        sudo apt-get install -q -y nodejs
    fi
}

# real work
bash scripts/common.sh
install_zsh
install_nodejs
