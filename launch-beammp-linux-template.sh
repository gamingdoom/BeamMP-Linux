#!/usr/bin/env bash

# These two must be on the same drive
protonModsFolder="PMODS"
nativeModsFolder="NMODS"

# Lutris game identifiers
lutrisbeammpid="MPID"
lutrisbeamnglinuxid="NATID"

# Launch BeamNG Linux and BeamMP from lutris.
echo "Launching BeamNG Native Linux"
lutris lutris:rungame/$lutrisbeamnglinuxid
# Sleep for 8s to prevent race condition. On my computer, this usually makes it so that BeamMP starts right on time.
sleep 8
echo "Launching BeamMP"
lutris lutris:rungame/$lutrisbeammpid

echo "Removing last time's mods"
cd $nativeModsFolder
find . ! -name beammp.zip ! -name BeamMP.zip -maxdepth 1 -type f -delete

echo "Watching for mods that need to be loaded"
inotifywait -m -e create -e moved_to --format "%f" $protonModsFolder/multiplayer \
        | while read filename
                do
                        echo "Detected mod $filename, hard linking in 0.5s"
			sleep 0.5
                        ln $protonModsFolder/multiplayer/$filename $nativeModsFolder/multiplayer/$filename
                done