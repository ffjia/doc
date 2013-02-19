# Download

http://mirrors.163.com/archlinux/iso/2012.10.06/

Write ISO to USB stick

[USB Installation] (https://wiki.archlinux.org/index.php/USB_Installation_Media)

    # lsblk
    # dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx

# Installation

    # setfont Lat2-Terminus16

## Partition

### Schema

    /---  - 2M
    /boot - 100M
    /     - 15G
    /var  - 10G
    /home -

### Create partitions

    # cgdisk /dev/sda
    EF02

    # lsblk
    # mkfs.ext4 /dev/sda2

    # pvcreate /dev/sda3
    # pvcreate --dataalignment 1m /dev/sda2
    # vgcreate arch /dev/sda3
    # lvceate -L #{size} main arch
    # mkfs.ext4 /dev/arch/main

## Mount Partitions

    # mount /dev/arch/main /mnt
    # mkdir /mnt/boot
    # mount /dev/sda2 /mnt/boot

## Select mirror

    ## Score: 5.8, China
    Server = http://mirrors.163.com/archlinux/$repo/os/$arch

## Setup network

    # ip link set wlan0 up
    # wifi-menu wlan0

## Install base system

    # pacstrap -i /mnt base base-devel

### Setup pacman and fstab

    /etc/pacman.conf
    /etc/pacman.d

    # genfstab -U -p /mnt >> /mnt/etc/fstab

### Chroot and configure base system

    # arch-chroot /mnt

    # vi /etc/locale.gen
    # locale-gen

    # ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

    # vi /etc/hostname

    # vi /etc/mkinitcpio.conf
    # mkinitcpio -p linux

#### Set the root password

    # passwd

    $ useradd -m -G \
                adm, disk,lp,wheel,log,network,video,audio,optical,storage,scanner,camera,power\
                -s /bin/bash -u 1000 ffjia
    $ passwd ffjia

### Install bootloader

    # pacman -S grub-bios
    # grub-install --target=i386-pc --recheck /dev/sda
    # cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo

    # grub-mkconfig -o /boot/grub/grub.cfg

### Install wireless tools

    # pacman -S wireless_tools wpa_supplicant wpa_actiond dialog

### Unmount partitions and reboot

    # exit
    # umont /mnt/{boot,}
    # reboot

# Configure

## Setup DNS resolver

    /etc/NetworkManager/dispatcher.d
    resolvconf="/etc/resolv.conf"

    # cat "$resolvconf".nm > "$resolvconf".tmp 2> /dev/null
    # mv -f "$resolvconf".tmp "$resolvconf"

## Config Trackpoint

    /etc/X11/xorg.conf.d/20-thinkpad.conf

    Section "InputClass"
        Identifier      "Trackpoint Wheel Emulation"
        MatchProduct    "TPPS/2 IBM TrackPoint|DualPoint Stick|Synaptics Inc. Composite TouchPad / TrackPoint|Lite-On Technology Corp. ThinkPad USB Keyboard with TrackPoint"
        MatchDevicePath "/dev/input/event*"
        Option          "EmulateWheel"       "true"
        Option          "EmulateWheelButton" "2"
        Option          "Emulate3Buttons"    "false"
        Option          "XAxisMapping"       "6 7"
        Option          "YAxisMapping"       "4 5"
    EndSection

## Install Extra pacakges

    # pacman -S ntfs-3g
    # pacman -Syy && pacman -Su
    # pacman -S sudo bash-complation screen openssh rsync pacman-contrib

    # pacman -S --asdeps gpm>=1.20.4 libxt gtk2 mercurial
    # pacman -S git mutt fetchmail procmail w3m pinentry

    # pacman -S kdebase-dolphin kdebase-plasma ttf-dejavu terminus-font kdeplasma-applets-networkmanagement kdebase-konsole kdeutils-kwallet gtk-qt-engine modemmanager usb_modeswitch

    # pacman -U vim-hg-3913-1-x86_64.pkg.tar.xz

    # pacman -S ecryptfs-utils keyutils

    # pacman -S firefox flashplugin ibus ibus-table ibus-qt pdnsd openvpn sysstat lsof mplayer2

    # pacman -U ibus-1.4.2-2-x86_64.pkg.tar.xz kdeplasma-addons-applets-kimpanel-4.8.1-1-x86_64.pkg.tar.xz
    # pacman -S aria2c

    # pacman -S xorg-server xf86-video-intel syslog-ng chromium skype

