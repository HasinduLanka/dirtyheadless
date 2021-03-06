#!/bin/bash

mkdir sand
cd sand

echo "Do not run this in a User Interactive machine. This will break your /bin/xdg-open "

sudo add-apt-repository -y ppa:alessandro-strada/ppa
sudo apt update && sudo apt install -y google-drive-ocamlfuse


mkdir -p ~/.gdfuse/default


cd "$(dirname "$0")"

cp ./DriveFuse/config ~/.gdfuse/default/config

get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

printf "Icon=" >> ~/Desktop/GoogleDriveFuse.desktop
get_abs_filename ~/.gdfuse/GoogleDrive.png >> ~/Desktop/GoogleDriveFuse.desktop


echo "mkdir ~/GoogleDrive ; google-drive-ocamlfuse ~/GoogleDrive" > ~/google-drive-fuse-start.sh
echo "pkill -c -f -9 google-drive-ocamlfuse ; fusermount -u ~/GoogleDrive " > ~/google-drive-fuse-stop.sh

chmod +x ~/google-drive-fuse-start.sh
chmod +x ~/google-drive-fuse-stop.sh

echo
echo "You are just one keypress away from ruining up your Operating system"
echo "Following functionality is designed only for Authorizing Headless computers (with no GUI access) as they have no xdg-open installed"
echo "Press [Enter] to replace your /bin/xdg-open with a dummy script"
echo "Do this only if you know what your are doing"
echo "You can recover your original /bin/xdg-open from /bin/xdg-open.back"
echo "Press CTRL+C to cancel this"
read line

sudo mkdir -p /bin/
sudo cp /bin/xdg-open /bin/xdg-open.back

sudo bash -c 'echo -e $"#!/bin/sh\necho \$* > /dev/stderr" > /bin/xdg-open'
sudo chmod +x /bin/xdg-open

echo "You can authorize by running  ~/google-drive-fuse-start.sh "
