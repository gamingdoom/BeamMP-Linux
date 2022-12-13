#!/usr/bin/env bash

function yes_or_no {
    while true; do
        read yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) return 1  ;;
        esac
    done
}

echo "Checking for dependencies ..."
if [[ $(which lutris) != "" && $(which inotifywait) != "" ]]; then
    echo "Dependencies found."
else    
    echo "Dependencies not found. Please install lutris and inotify-tools"
fi

echo "Hello, please follow https://web.archive.org/web/20210711151252/https://www.reddit.com/r/BeamMP/comments/oi67rf/beammp_on_linux_guide/ to setup BeamMP if you haven't already. Press enter when this is done."
read

echo "Is $HOME/.steam/steam/steamapps/compatdata/284160/pfx/drive_c/users/$USER/AppData/Local/BeamNG.drive/0.27/mods/ is this the path of BeamNG.Drive's mods folder for proton? [y/n]"

if ! yes_or_no; then
    read -p "Please enter BeamNG.Drive's mods folder for proton: " protonpath
else
    protonpath="$HOME/.steam/steam/steamapps/compatdata/284160/pfx/drive_c/users/$USER/AppData/Local/BeamNG.drive/0.27/mods"
fi

echo "Is $HOME/.local/share/BeamNG.drive/0.27/mods/ is this the path of BeamNG.Drive's mods folder for native? [y/n]"

if ! yes_or_no; then
    read -p "Please enter BeamNG.Drive's mods folder for proton: " nativepath
else
    nativepath="$HOME/.local/share/BeamNG.drive/0.27/mods"
fi

read -p "Please enter the lutris identifier for BeamMP: " beammpid 

read -p "Please enter the lutris identifier for BeamNG.drive native Linux build: " beamngid 

mkdir -p $nativepath/multiplayer

echo "Downloading latest version of BeamMP. You will need to manually update this by downloading beammp.zip from https://github.com/BeamMP/BeamMP/releases/latest and putting it in $nativepath/multiplayer, replacing the old one."
wget https://github.com/BeamMP/BeamMP/releases/latest/download/beammp.zip -O $nativepath/multiplayer/beammp.zip

echo "Generating a BeamMP launch script for you ..."
cat launch-beammp-linux-template.sh | sed "s:PMODS:$protonpath:g" | sed "s:NMODS:$nativepath:g" | sed "s:MPID:$beammpid:g" | sed "s:MPID:$beammgid:g" > beammp-linux.sh
chmod +x beammp-linux.sh
echo "Done. Run beammp-linux.sh with ./beammp-linux.sh to start BeamMP."
