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
		npm \
		nerd-fonts-inconsolata \
		ttf-yosemite-san-francisco-font-git \
		ttf-dejavu \
		otf-font-awesome \
		noto-fonts-extra \
		noto-fonts-cjk \
		noto-fonts-emoji \
		powerline \
		powerline-fonts \
		ranger \
		w3m \
		nodejs \
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
		xbindkeys \
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
		pandoc \
		scrot \
		pyenv \
		deezer


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
		ipykernel \
		scipy \
		pingouin \
		tqdm \
		cython \
		llvmlite \
		tslearn \
		hdbscan \
		umap \
		pymc3 \
		nodejs \
		newsboat


# clone dotfiles somewhere here


# install vim-plug to manage neovim plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# for openttd to run natively in arch
yay -S \
		openttd \
		openttd-opengfx \
		openttd-opensfx \
		openttd-openmsx \
		timidity++ \
		freepats-general-midi

# add self to audio group
gpasswd -a <user> audio
# point to freepats in /etc/timidity/timidity.cfg
# soundfont /usr/share/soundfonts/freepats-general-midi.sf2
