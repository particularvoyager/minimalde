#!/bin/bash

rm -rf ~/.config/minimalrc

echo "Remove suckless tools"
cd dmenu/ && sudo make uninstall
cd ../dwm/ && sudo make uninstall
cd ../st/ && sudo make uninstall
cd ../slock/ && sudo make uninstall
