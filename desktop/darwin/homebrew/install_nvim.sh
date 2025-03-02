if not [ -f ~/.config/nvim/initialized ]; then
    echo "Neovim is not installed yet. Installing..."
    mv ~/.config/nvim ~/.config/nvim.bak
    mv ~/.local/share/nvim ~/.local/share/nvim.bak
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    rm -rf ~/.config/nvim/.git
    touch ~/.config/nvim/initialized
else
    echo "Neovim is already installed. Exit..."
    exit 0
fi