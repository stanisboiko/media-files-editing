# Media files editing

Handy scripts for work with media files

---

## [change-timestamp](https://github.com/stanisboiko/media-files-editing/blob/3c22425748f2660a6c0cba404af345952d4c74a6/change-date-created.sh) script

### Purpose
If you store all your main photos and videos library in Google Photos, iCloud Photos, etc, you should consider backing them up on a separate drive off-the-grid.
But unlike those cloud services that nicely sort your media based on metadata, your local copies are stored as files, and file systems by default show file metadata, not photo metadata hence problems arise.
It solves my main concerns:

* I can have logical dates when photos were created not files
* Files can be easily sorted based on when photos were taken
* os agnostic
* no extra overhead storing in directories as albums
* mostly nobody cares when files were created anyway

I set it to specifically work with ```.jpg```, ```.heic```, ```.mp4```, ```mov```, ```mkv``` only as they are the most common files extension for storing end media and use standard metadata tags.

## [delete-gps-metadata](https://github.com/stanisboiko/media-files-editing/blob/422340a08c795c2818f61d5ce690dc62da798338/delete-gps-metadata) script

### Purpose

* deletes sensitive GPS metadata from files.

---

### Add as a Quick Action on Mac

![ChangeDateCreatedTest](https://github.com/stanisboiko/media-files-editing/assets/12517198/d3573f46-76cb-49f5-8e78-d2d22da9bf02)

1. In Terminal run ```brew install exiftool```.
2. Open Automator, click on __New Document__, then select __Quick Action__ as a document type.
3. In the top windows in Workflow receive current set __Document__ in __Finder.app__.
4. From Library on the left add __Run Shell Script__ to the workflow.
5. In the added Run Shell Script set __Select Pass input: as arguments__ and paste a script to the main body. Save your workflow.
6. In Finder right click on selected files, navigate to Quick Actions and apply a script.
7. Logs are in the user's home directory.

Note that you don't need to add Get Selected Finder items to the workflow as it will result in [executing twice](https://discussions.apple.com/thread/8246012 "") on the same file
