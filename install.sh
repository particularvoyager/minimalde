#!/bin/bash
echo "Create minimalde config folder"
mkdir ~/.config/minimalrc

read -r -p "Use custom xinitrc? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        rm -rf ~/.xinitrc
        echo "Setup new xinitrc file"
        cp etc/xinitrc ~/.xinitrc
        echo "Done"
        ;;
    *)
        echo "Okay"
        ;;
esac

read -r -p "Setup custom folder path? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        rm -rf ~/.config/user-dirs.dirs
        mkdir ~/all ~/downloads ~/media ~/media/shots ~/media/shots/cast ~/media/shots/img ~/media/docs ~/media/music ~/media/patterns ~/media/pix ~/media/vid 
        echo "Setup new user-dirs file"
        cp etc/user-dirs.dirs ~/.config/user-dirs.dirs
        xdg-user-dirs-update
        echo "Done"
        ;;
    *)
        echo "Okay"
        ;;
esac

echo "Setup sutils tools in /usr/local/bin"
cd sutils/
sudo ln dmenu-power /usr/local/bin
sudo ln dmenu-kill /usr/local/bin
sudo ln dmenu-shots /usr/local/bin
sudo ln dmenu-runner /usr/local/bin
sudo ln wallset /usr/local/bin
sudo ln dwm-bar /usr/local/bin
sudo ln brownoutd /usr/local/bin

echo "Setup suckless tools"
cd ../dmenu/ && make && sudo make install
cd ../dwm/ && make && sudo make install
cd ../st/ && make && sudo make install
cd ../slock/ && make && sudo make install
cd ../brownout/ && make && sudo make install
