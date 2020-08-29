##############################################
# packages for day-to-day usage, DE, theming #
##############################################


# install yay 
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# keys for spotify and dropbox
curl -sS https://download.spotify.com/debian/pubkey.gpg | gpg --import -
gpg --keyserver keyserver.ubuntu.com --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E

# main packages
yay -Syu \
		xorg \
		xinit \
		python-pip \
		i3-gaps \
		rxvt-unicode \
		neovim \ 
		ranger \
		picom \
		polybar \
		rofi \
		feh \
		zathura \
		firefox \
		pulseaudio \
		pulseaudio-alsa \
		task \
		typora \
		spotify \
		texlive-most \
		texstudio \
		powerline \
		powerline-fonts \
		xdg-user-dirs \
		nerd-fonts-inconsolata \
		ttf-yosemite-san-francisco-font-git \
		otf-font-awesome

# create default user dirs
xdg-user-dirs-update

# python
pip3 install jedi \
		numpy \
		pandas \
		requests \
		matplotlib \
		scipy \
		seaborn \

# clone dotfiles somewhere here


# install vim-plug to manage neovim plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

