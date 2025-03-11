# Note
I wouldn't recommend using this as I have ported the official BeamMP launcher to Linux. The port is available [here](https://github.com/BeamMP/BeamMP-Launcher/).

# BeamMP-Linux
BeamMP-Linux is a set of scripts to run BeamMP with the native Linux build of BeamNG.Drive. The native Linux build Of BeamNG.Drive runs a lot faster than the Windows build through wine (2.5-10x higher FPS on my computer).

# Setup
First, follow [these instructions](https://web.archive.org/web/20210711151252/https://www.reddit.com/r/BeamMP/comments/oi67rf/beammp_on_linux_guide/) to setup BeamMP in wine. If you just want to play BeamMP on Linux, this is the easiest way. If you would like to take it a step further and use the native version to get much better performance, follow the rest of this guide.

After setting up BeamMP in wine, you will need Lutris, to launch and manage everything. Install Lutris. After installing Lutris, add a locally installed game. As the name, put something like BeamMP. For ``Runner``, put ``wine``. In ``Executable`` from the ``Game Options`` tab, put everything that comes after ``run`` from step 10 on the guide from the previous step. Set ``Wine Prefix`` to what you set STEAM_COMPAT_DATA_PATH to in step 9. You can then click save.

After this, add another locally installed game and set the name as something like BeamNG Linux. For the runner, select Linux. For ``Executable``, put the path to BeamNG.Drive's Linux executable (game_path/BinLinux/BeamNG.drive.x64). Here is the place to enable MangoHud if would like.

After that step, run these commands:
```
git clone https://github.com/gamingdoom/BeamMP-Linux.git
cd BeamMP-Linux
```
```
chmod +x setup.sh
./setup.sh
```
You will now run through the setup. Note that the mods folder for the proton version of the game and the mods folder for the native version of the game must be on the same drive. The Lutris identifier for each entry in Lutris is in the ``Configure`` menu, inside the dropdown next to the play button for each entry.

After setup, you will get a script which can be run to launch BeamMP with the native Linux build of the game. Note that you will need to manually update the BeamMp mod by downloading [beammp.zip](https://github.com/BeamMP/BeamMP/releases/latest) and putting it in your_native_linux_mods_path/multiplayer, replacing the old one.

# Usage
After running the script, BeamNG Linux and BeamMP should launch seperately. You should see the BeamNG launcher and BeamNG.Drive. You should ignore the launcher but not close it. On the normal BeamNG, go to multiplayer and use it as normal. You may have to click connect. It will not work until the BeamNG launcher shows up. The favorites don't seem to save for me. Once you are done, ctrl+c the script as it will not exit by itself.
