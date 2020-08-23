# Cheat sheet for arch install, for reference, not to run
# Putting exit here in case it is run
# To be made executable script later

exit 0

# Boot ISO
# verify integrity 
# gpg --keyserver-options auto-key-retrieve --verify [arch-iso].sig

# set keymap, internet, clock
loadkeys uk
ip link
timedatectl set-ntp true

# partition the disks interactively
cfdisk  # legacy for BIOS, gpt for UEFI
#  large bootable partition, small swap partition
mkfs.ext4 /dev/sdX1
mkswap /dev/sdX2
swapon /dev/sdX2

mount /dev/sdX1 /mnt

# format ESP and mount on root partition (UEFI)
mkfs.fat -F32 /ev/sdxY
mount /dev/sdX /boot

# edit mirror list, retain local servers
vim /etc/pacman.d/mirrorlist

# install base package
pacstrap /mnt base base-devel linux linux-firmware

# generate fstab
genfstab -U /mnt >> /mnt/etc/fstab

# change root into new system
arch-chroot /mnt

# install dependencies missed by pacstrap installation
pacman -Syu \

		cryptsetup \
		dhcpcd \
		inetutils \
		jfsutils \
		logrotate \
		lvm2 \
		man-db \
		man-pages \
		mdadm \
		netctl \
		reiserfsprogs \
		s-nail \
		sysfsutils \
		texinfo \
		usbutils \
		vim \
		which \
		xfsprogs \
		hwinfo \
		git

# set time-zone
ln -sf /user/share/zoneinfo/Region/City /etc/localtime

# generate /etc/adjtime
hwclock --systohc

# uncomment en_GB.UTF-8 and other needed locales in /etc/locale.gen
locale-gen

# create the locale.conf(5) file, and set the LANG variable accordingly
vim /etc/locale.conf
# set LANG=en_GB.UTF-8

# make changes to keyboard persistent
vim /etc/vconsole.conf
# set KEYMAP=uk
# if that doesn't work try this: localectl set-keymap --no-convert "keymap" 

# make the hostname file
vim /etc/hostname
# enter the desired hostname

# add matching entries to host
vim /etc/hosts
# 127.0.0.1	  localhost
# ::1		  localhost
# 127.0.1.1	  myhostname.localdomain	"myhostname"

# enable dhcpcd
systemctl enable dhcpcd.service

# create root password with passwd command
passwd

# set up user
useradd -m "myuser"
passwd "myuser"

# set myself up as a user, added to grooups audio, optical, video, storage, wheel
pacman -S sudo # if sudo isn't already installed
usermod -aG wheel,audio,video,optical,storage "myuser"
groups "myuser" # just to check

# Allow sudo rights to users in wheel group
sudoedit /etc/sudoers
# uncomment line "uncomment to allow members of group wheel to execute any command


# rEFInd for UEFI
pacman -S refind-efi
refind-install --usedefault /dev/sdx
# update PARTUUID in refind.conf
# create/modify refind_linux.conf with correct PARTUUID
# uncomment "extra" line in refind.conf to enable automatic detection of arch kernel

# theme for rEFInd bootloader
cd /boot/EFI/refind/
mkdir -p themes
git clone https://github.com/EvanPurkhiser/rEFInd-minimal themes/rEFInd-minimal
echo "include themes/refind-minimal/theme.conf" >> refind.conf

reboot


passwd --lock root

# Installed SSH, disabled root login through SSH
pacman -S openssh
visudo /etc/ssh/sshd_config # PermitRootLogin no
sudo systemctl restart sshd.service

# Upgrade microcode (install appropriate package for current CPU)
sudo pacman -S intel-ucode # or amd-ucode
# update refind_linux.conf with microcode initramfs

# Install virtaulbox-guest-utils (if currently running in VM)
sudo pacman -S virtualbox-guest-utils
# virtualbox-guest-modules-arch for default linux
# enable virtualbox
sudo systemctl enable vboxservice.service

# Install xf86-video-vmware
sudo pacman -S xf86-video-vmware

# Set X11 keyboard layout
localectl set-x11-keymap gb

