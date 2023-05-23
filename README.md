# Media files editing

Handy scripts for work with media files on Mac

---

## Change Date Created 

### Purpose
If you like me store all your photos and videos in Google Photos or iCloud Photos, you definately thought about keeping them as a backup on separate drive.
But unlike those cloud services that sort your media based on camera metadata, your local copies are stored as files and file systems by default show only Date Created and Modify Date.
This doesn't work for me since I want to keep logical date taken order without an effort to keep them in separate folders.
I set it to specifically work with ```.jpg```, ```.heic```, ```.mp4```, ```mov```, ```mkv``` only as they are the most common files extension for storing end media and use similar metadata structure.

[This script](https://github.com/stanisboiko/media-files-editing/blob/3c22425748f2660a6c0cba404af345952d4c74a6/change-date-created.sh "change-date-created.sh") retrieve the date when the photo or video was taken and replace Date Created.

### Add as a Quick Action

![ChangeDateCreatedTest](https://github.com/stanisboiko/media-files-editing/assets/12517198/d3573f46-76cb-49f5-8e78-d2d22da9bf02)

1. In Terminal ```brew install exiftool```
2. Open Automator and select Quick Action document type
3. Adjust suitable workflow settings to feed only files and folders in Finder.app
4. From Library add only Run Shell Script to the workflow
5. Choose ```Pass input: as arguments``` and paste the [script](https://github.com/stanisboiko/media-files-editing/blob/3c22425748f2660a6c0cba404af345952d4c74a6/change-date-created.sh "change-date-created.sh")
6. Within the script make sure to set ```tz``` value according to the timezone where the photo or video was captured and replace the log path ```$HOME/changedate.log``` with desirable
7. Save. Select files in Finder, Right Click and go to Quick Actions. You don't need to add Get Selected Finder items as it will result in [executing twice](https://discussions.apple.com/thread/8246012 "") on the same file

### Cautions
* Metadata are a giant mess and this won't work in all cases as they are often corrupted or incompatible.
* Be aware of Time Zones!

---
