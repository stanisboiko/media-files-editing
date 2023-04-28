# Media files editing

Handy scripts for work with media files

---

## Change Date Created

If you like me store all your photos and videos in Google Photos or iCloud Photos, you definately thought about keeping them as a backup on separate drive.
But unlike those cloud services that sort your media based on camera metadata, your local copies are stored as files and file systems by default show only Date Created and Modify Date.
This doesn't work for me since I want to keep logical date taken order without an effort to keep them in separate folders.

[This script](https://github.com/stanisboiko/media-files-editing/blob/3c22425748f2660a6c0cba404af345952d4c74a6/change-date-created.sh "change-date-created.sh") retreive date when photo or video was taken and replace Date Created. 

### Precautions
* Have ```exiftool``` installed
* Works with ```.jpg```, ```.heic```, ```.mp4```, ```mov```, ```mkv``` as they are the most common files extention for storing processed media and use similar metadata structure
* Be aware of Time Zones!

### Its convenient to add as a Quick Action.

1. In Terminal ```brew install exiftool```
2. Open Automator and select document type as Quick Action
3. Adjust suitable workflow settings to feed only files and folders in Finder.app
4. From Library add Run Shell Script
5. Choose ```Pass input: as arguments``` and paste the [script](https://github.com/stanisboiko/media-files-editing/blob/3c22425748f2660a6c0cba404af345952d4c74a6/change-date-created.sh "change-date-created.sh") inside the window
6. Within the script make sure to set ```tz``` value according to the timezone where photo was captured and replace desirable log path ```$HOME/changedate.log```
7. Save. Select files in Finder, Right Click and go to Quick Actions. You don't need to add Get Selected Finder items as it will result in [executing twice](https://discussions.apple.com/thread/8246012 "") on the same file


> Note that metadata are a mess and this won't work in all cases as they are often corrupted or incompatible.



---
