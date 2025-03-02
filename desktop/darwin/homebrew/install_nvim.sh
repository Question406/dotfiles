if ! [ -f ~/.config/nvim/initialized ]; then
    echo "Neovim is not installed yet. Installing..."
    if [ -f ~/.config/nvim ]; then
        mv ~/.config/nvim ~/.config/nvim.bak
    fi
    if [ -f ~/.local/share/nvim ]; then
        mv ~/.local/share/nvim ~/.local/share/nvim.bak
    fi
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    rm -rf ~/.config/nvim/.git
    touch ~/.config/nvim/initialized
else
    echo "Neovim is already installed. Exit..."
    exit 0
fi