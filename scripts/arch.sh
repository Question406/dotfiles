sudo pacman -S --noconfirm --needed wget

bash scripts/common.sh
sudo pacman -S --noconfirm --needed zsh vim tmux nodejs openssh
chsh -s $(which zsh)
