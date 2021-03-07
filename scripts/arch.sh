sudo pacman -S --noconfirm --needed wget

bash scripts/common.sh
sudo pacman -S --noconfirm --needed zsh vim tmux nodejs openssh ranger
chsh -s $(which zsh)
