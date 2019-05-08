# my-scripts

## beamerTemplate.sh
Script that copies my favorite beamer setup into the filepath specified.
## prefixDirectory.sh
Script that takes the current directory and adds Drive to it.
i.e. ~/Academics will become ~/Drive/Academics.
This is to help with pushing to drive.
## texTemplate.sh
Script that copies my favorite latex setup into the filepath specified.

## backup
Contains a single file named backup.sh.
backup.sh opens a dmenu with ranging options.
### Backup
The Backup option backs up the entire home directory (with exceptions specified in ~/Backup/resticExclusions).
Once the backup is done, it'll run the restic diff command and store the list of differences in ~/Backup/resticDiff.
Once that's done, the [dirtree](https://github.com/emad-elsaid/dirtree) command will be called on it, and then displayed in google chrome.
### Forget
The Forget option will restic forget all the options chosen (multi select is on for rofi)
### Prune
Simply calls restic prune
### Drive Push
Pushes the contents to Google Drive using the [drive](https://github.com/odeke-em/drive) command

## computer
Contains a single file named computer.sh.
Is a rofi meny containing three options, shutdown, reboot, and lock.
### Shutdown
Simply calls `sudo shutdown now`.
### Reboot
Simply calls `sudo reboot now`.
### Lock
Runs i3-lock.

## dmenuCalc
Runs a rofi menu with no options which is simply piped into `bc -l`, and then copied to clipboard.
This was intended as a replacement of always opening google for a calculator.

## gchrome
Runs a rofi menu with various options like Normal, Incognito, Guest, etc.

## latexLectureNotes
A script for placing in a directory with many latex files inside (like a course).
All .tex files should be placed in a directory called `src/`.
All .pdf files will be placed in a directory called `pdf/`.

## light
Contains three files called `light.sh`, `lightIncrease.sh`, and `lightDecrease.sh`.
Each controls the brightness of my monitor using the [light](https://github.com/haikarainen/light) command.

## lockScreen
Contains scripts which takes a screenshot, pixelates the screenshot, and then uses it as a lockscreen.

## otflatex (on the fly latex)
Contains a single script called `otflatex.sh`.
Opens a vim with a preset latex, filling it out will compile the pdf, convert the pdf into a png, and then place the png into the clipboard.

## rice-readme
Converts configs to a pdf (for now only has i3 configs)

## themeing 
Rofi menu with options that include themes.
It replaces the Wallpaper and lock screen image with the specified picture.

## todo
Script that has two options.
Opening  ranger for the directory `.todo/` and Drive Push.

## touchpad
Script that enables or disables the touchpad.
