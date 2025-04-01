#!/bin/sh

echo -e "\033[48;5;15;1;30m Starting Post-Install \033[0m"
echo -e "\033[48;5;15;1;30m Updating System \033[0m"

sudo pacman -Syu

echo -e "\033[48;5;15;1;30m Installing Essential Packages \033[0m"
sudo pacman -S --noconfirm p7zip bc bluez bluez-utils brightnessctl chafa cliphist feh file-roller flatpak foot gammastep git gvfs-mtp htop hyprland hyprlock hyprpicker lf libsixel man-db mpv neofetch neovim noto-fonts noto-fonts-cjk noto-fonts-extra nwg-look papirus-icon-theme pavucontrol python-pipx rclone rofi-wayland rofi-emoji swaync swww thunar thunar-archive-plugin ttf-hack ttf-jetbrains-mono ttf-roboto tumbler ufw waybar wget wlroots wob xdg-desktop-portal-gtk zathura zathura-pdf-mupdf zsh

echo -e "\033[48;5;15;1;30m Installing yay (AUR helper) \033[0m"
mkdir ~/yay
git clone https://aur.archlinux.org/yay-bin.git ~/yay 
cd ~/yay
makepkg -si
cd 
rm -rf ~/yay

echo -e "\033[48;5;15;1;30m Uninstalling yay-bin-debug \033[0m"
sudo pacman -Rns yay-bin-debug

echo -e "\033[48;5;15;1;30m Installing Packages from AUR \033[0m"
yay -Sy --noconfirm --needed hyprshot python-pywal16

echo -e "\033[48;5;15;1;30m Installing apps from flatpak \033[0m"
echo -e "\033[48;5;15;1;30m Installing Flatseal \033[0m"
flatpak install flathub com.github.tchx84.Flatseal
echo -e "\033[48;5;15;1;30m Installing Gnome-Clocks \033[0m"
flatpak install flathub org.gnome.clocks
echo -e "\033[48;5;15;1;30m Installing Gnome-Calculator \033[0m"
flatpak install flathub org.gnome.Calculator 
echo -e "\033[48;5;15;1;30m Installing Brave \033[0m"
flatpak install flathub com.brave.Browser
echo -e "\033[48;5;15;1;30m Installing Gimp \033[0m"
flatpak install flathub org.gimp.GIMP
echo -e "\033[48;5;15;1;30m Installing Obsidian \033[0m"
flatpak install flathub md.obsidian.Obsidian
echo -e "\033[48;5;15;1;30m Installing libreoffice \033[0m"
flatpak install flathub org.libreoffice.LibreOffice
echo -e "\033[48;5;15;1;30m Installing keepassxc \033[0m"
flatpak install flathub org.keepassxc.KeePassXC
echo -e "\033[48;5;15;1;30m Installing Anki \033[0m"
flatpak install flathub net.ankiweb.Anki
echo -e "\033[48;5;15;1;30m Installing SimpleX \033[0m"
flatpak install flathub chat.simplex.simplex
echo -e "\033[48;5;15;1;30m Installing VSCodium \033[0m"
flatpak install flathub com.vscodium.codium

echo -e "\033[48;5;15;1;30m Installing Packages from python-pipx \033[0m"
pipx install yt-dlp
pipx install gytmdl

echo -e "\033[48;5;15;1;30m Changing default shell to zsh \033[0m"
chsh -s $(which zsh)

echo -e "\033[48;5;15;1;30m Cloning dotfiles \033[0m"
mkdir ~/dotfiles
git clone https://github.com/realsuryanshu/dotfiles.git ~/dotfiles/
ln -s ~/dotfiles/.cfg ~/
ln -s ~/dotfiles/.scripts ~/
ln -s ~/dotfiles/.local/share/fonts ~/.local/share/

ln -s ~/.cfg/foot ~/.config/
ln -s ~/.cfg/hypr ~/.config/
ln -s ~/.cfg/lf ~/.config/
ln -s ~/.cfg/rofi ~/.config/
ln -s ~/.cfg/swaync ~/.config/
ln -s ~/.cfg/waybar ~/.config/
ln -s ~/.cfg/wob ~/.config/
ln -s ~/.cfg/zsh/.* ~/  

sudo ln -s ~/.scripts/* /usr/local/bin

echo -e "\033[48;5;15;1;30m UFW settings \033[0m"
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

echo -e "\033[48;5;15;1;30m Post-Install Complete :) \033[0m"
