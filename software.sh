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
		lightdm \
		lightdm-slick-greeter \
		rxvt-unicode \
		neovim \ 
		nerd-fonts-inconsolata \
		ttf-yosemite-san-francisco-font-git \
		otf-font-awesome \
		noto-fonts-extra \
		noto-fonts-cjk \
		noto-fonts-emoji \
		powerline \
		powerline-fonts \
		ranger \
		picom \
		polybar \
		rofi \
		feh \
		zathura \
		zathura-pdf-mupdf \
		zathura-cb \
		firefox \
		pulseaudio \
		pulseaudio-alsa \
		pavucontrol \
		udisks2 \
		udiskie \
		r \
		nvim-r \
		rstudio-desktop-bin \
		tmux \
		tmuxinator \
		task \
		typora \
		spotify \
		dropbox \
		signal-desktop \
		telegram-desktop \
		discord \
		texlive-most \
		texstudio \
		xdg-user-dirs \
		llvm10 \
		gcc-fortran \
		anki \
		redshift \
		backintime \
		mpd \
		ncmpcpp \
		xournalpp \
		xf86-input-wacom \


# create default user dirs
xdg-user-dirs-update

# python
pip3 install jedi \
		numpy \
		pandas \
		requests \
		matplotlib \
		seaborn \
		jupyterlab \
		scipy \
		pingouin \
		tqdm \
		cython \
		llvmlite \
		tslearn \
		hdbscan \
		umap \
		pymc3 \
		nodejs 


# clone dotfiles somewhere here


# install vim-plug to manage neovim plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

