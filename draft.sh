networkmanager
nm-aplet
wayland
wlroots
xorg-server-xwayland
xdg-desktop-portal-gtk
xdg-desktop-portal-hyprland
gnome-keyring
mesa
mesa-utils
sddmn 
swaybg
hyprlock 
hypridle
pipewire 
pipewire-pulse 
wireplumber 
pavucontrol
hyprland  
vimix-cursors
ttf-martian-mono-nerd
tela-circle-icon-theme-brown
kitty
ranger
zsh
waybar
git
gh 
openssh
neovim
chromium
thunar
obsidian
grim
slurp
macchina
wl-clipboard 
swaync
cliphist
bleachbit 
nwg-look
swayimg 
powertop
tlp
bluez
blueman
gnome-logs
tldr
tmux
fzf
solanum
eza
bat 
obs-studio
btop
ranger
calcurse 
blueman
gedit
gtk-engine-murrine

#xdg-desktop-portal-wlr #for sway
#sway swaymsg # for sway
#rsync
#lxappearane
#virtualbox
#virtualbox-host-modules-arch
# gtk theme - https://www.gnome-look.org/p/1681313/
# cursor theme - https://github.com/sainnhe/capitaine-cursors/releases

###################aur########################
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
##############################################

### from aur
door-knocker
smash
cava
gruvbox-plus-icon-theme-git
# superfile 


###################for zsh####################
# zsh-custom-plugins 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab ~/.config/fzf-tab
# starship
curl -sS https://starship.rs/install.sh | sh
# ohmyzsh 
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#############################################


###################vimplug####################
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
##############################################


##################for gtk4####################
gsettings set org.gnome.desktop.interface cursor-theme 'Vimix-cursors'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Gruvbox-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'gruvbox-dark-icons-gtk'
##############################################


#################for cli clock################
git clone https://github.com/ckaznable/tenki
cd tenki
make build
make install
##############################################

################my custom sys Dashboard#######
git clone https://github.com/Jahamars/Dashboard.git
##############################################


#################for power button#############
sudo echo "HandlePowerKey=ignore" >> /etc/systemd/logind.conf
#or if you have this line just change it 
##############################################


#################for time progress######################
git clone https://github.com/jahamars/tbt ~/tbt
########################################################


#################for obs scripts ######################
git clone https://github.com/jahamars/obs-scripts ~/obs-scripts
########################################################
