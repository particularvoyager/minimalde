#!/bin/bash
echo "Create minimalde config folder"
mkdir ~/.config/minimalrc

read -r -p "Use custom xinitrc? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        rm -rf ~/.xinitrc
        echo "Setup new xinitrc file"
        mv etc/xinitrc ~/.xinitrc
        echo "Done"
        ;;
    *)
        echo "Okay"
        ;;
esac

echo "Setup sutils tolls in /usr/local/bin"
cd sutils/
sudo ln dmenu-power /usr/local/bin
sudo ln dmenu-kill /usr/local/bin
sudo ln dmenu-shots /usr/local/bin
sudo ln wallset /usr/local/bin

echo "Setup suckless tools"
cd ../dmenu/ && make && sudo make install
cd ../dwm/ && make && sudo make install
cd ../st/ && make && sudo make install
cd ../slock/ && make && sudo make install
