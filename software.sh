##############################################
# packages for day-to-day usage, DE, theming #
##############################################


# install yay 
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# main packages
yay -Syu \
		xorg \
		xinit \
		python-pip \
		i3-gaps \
		rxvt-unicode \
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
		nerd-fonts-inconsolata \
		ttf-yosemite-san-francisco-font-git \
		otf-font-awesome

# python
pip3 install jedi \
		numpy \
		pandas \
		requests \
		matplotlib \
		scipy \
		seaborn \

# clone dotfiles somewhere here

