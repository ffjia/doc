        ========================================
            X
        ========================================

# $Id: x 1417 2010-11-29 07:04:32Z ffjia $

X utility
=========

* Detect monitor

    $ sudo xresprobe vga


* Display information utility for X

    $ xdpyinfo
    $ xdpyinfo | grep resolution
    $ xdpyinfo | grep dimensions
    $ xdpyinfo | grep -B1 dots
    $ xdpyinfo -ext RENDER | grep sub-pixel

    $ xrdb -query

* Calculate VESA GTF mode lines

    $ gtf <1024 768 85>


* Print out X-Video extension info

    $ xvinfo | grep max


* Xrandr

    $ xrandr --verbose
    $ xrandr --output VGA1 --same-as LVDS1
    $ xrandr --output LVDS1 --off



* Display x status

    $ xset q


* Don't shutdown monitor
$ setterm -blank 0


* Shutdown monitor (DPMS support needed)

    $ xset dpms force off


* Disable  DPMS (Energy Star) features

    $ xset -dpms


* Blank 5 min and off after 10 min

    Section "ServerLayout"
            Identifier      "Default Layout"
            Screen          "Default Screen"
            InputDevice     "Generic Keyboard"
            InputDevice     "Configured Mouse"
            Option  "BlankTime"     "5"
            Option  "StandbyTime"   "0"
            Option  "SuspendTime"   "0"
            Option  "OffTime"       "10"
    EndSection


* List client applications running on a display

    $ xlsclients


$ LIBGL_DEBUG=verbose glxinfo


$ glxgears -printfps
$ glxgears -iacknowledgethatthistoolisnotabenchmark


* Use DISPLAY when switch to other users

    $ export DISPLAY=:0
    $ xauth merge /home/$USER/.Xauthority
    # or $ export XAUTHORITY=/home/$USER/.Xauthority
    # FIXME $ sux


* start x in chroot environment

    $ mount --bind /tmp/.X11-unix/ /path/to/chroot_system/tmp/.X11-unix/
    $ cp $XAUTHORITY /path/to/chroot_system/root/
    $ env - chroot /path/to/chroot_system/ /bin/bash
    $ export DISPLAY=:0.0; export XAUTHORITY=/root/.Xauthority
    $ xeyes


* Avoid having to start a second X server

    $ sudo aptitude install xserver-xephyr
    $ Xephyr:1
    # In Xerphyr xterm
    $ /usr/lib/kde4/bin/startkde


* X tree

    $ pstree
    ...
        ├─login───bash───startx───xinit─┬─Xorg───Xorg
        │                               └─xfce4-session─┬

    $ ps -C startx -o cmd
    CMD
    /bin/bash /usr/bin/startx
    $ ps -C xinit -o cmd
    CMD
    xinit /etc/X11/xinit/xinitrc -- /etc/X11/xinit/xserverrc -auth
    /tmp/serverauth.QJQGlW2249
    $ ps -C Xorg -o cmd
    CMD
    /usr/bin/X11/X -nolisten tcp
    /usr/bin/X11/X -nolisten tcp


How the Xorg servers calculate DPI
=================================

1. The -DPI command line option has highest priority.
2. If this is not used, the DisplaySize setting in the X config file is used to
   derive the DPI, given the screen resolution.
3. If no DisplaySize is given, the monitor size values from DDC are used to
   derive the DPI, given the screen resolution.
4. If DDC does not specify a size, 75x75 DPI is used by default.


Something should remember
========================

* Monitor data sheet

    "Samsung 732N" (LCD)
            HorizSync       30-81 (339/342mm)
            VertRefresh     56-75 (271mm)

   "Samsung 550S"
            HorizSync       30-61
            VertRefresh     50-120

    "Samsung 753DFX"
            HorizSync       30-70
            VertRefresh     50-160

    "View Sonic E70f-4"
            HorizSync       30-70
            VertRefresh     50-150


* The difference between "Desktop Enviroment" and "Window Manager"

    A desktop environment is generally more fully-featured than a window
    manager. Gnome and KDE both offer many system preferences,
    integrated filesystem browsers, application menus (such as the K
    Menu in KDE), and a whole bunch of other utilities, applets, and the
    like.

    Window managers are much more minimalistic, and will generally
    just display the application windows for you. Sometimes, they offer
    application menus, taskbars, system trays, and multiple desktops.
    Most of the time, these utilities are separate packages that you
    have to install in addition to the window manager.

    Desktop environments are great for new Linux users, whereas window
    managers can be much more highly customizable. Window managers, are
    generally lighter on the system resources than desktop environments.


Related Links
=============

http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
http://urukrama.wordpress.com/openbox-guide/
http://wiki.archlinux.org/index.php/Allow_a_program_to_continue_after_logoff#X_applications
http://blogs.koolwal.net/2009/11/02/howto-enabling-kernel-mode-setting-kms-in-debian-linux-kernel/
