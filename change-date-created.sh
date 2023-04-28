#!/bin/zsh

export PATH="$PATH:/usr/local/bin"

#Log
if [[ -e "$HOME/changedate.log" ]] ; then
	log="$HOME/changedate.log"
	else
	touch "$HOME/changedate.log"
	log="$HOME/changedate.log"
fi

#set timezone for media files. "man date" for more
tz="2H"

#Validate if media file has .heic, jpeg, .mp4, .mov or .mkv extention, retreive date then write it as file creation date
for mediaFile in "$@"
do
	#test if the file has valid photo extention
	if [[ "$mediaFile" =~ ^(.*)(\.(J|j)(P|p)(E|e)*(G|g))$ ]] || [[ "$mediaFile" =~ ^(.*)(\.(H|h)(E|e)(I|i)(C|c))$ ]] ; then
	#retrieve CreateDate
	photoDate=$(exiftool -s "$mediaFile" | grep ^CreateDate | tr -d : |  awk '{print $2$3}' | cut -c1-12)
		#test if date is not null or greater than 0
		if [[ -n $photoDate ]] && [[ $photoDate -gt 0 ]] ; then
		#overwrite CreateDate
		touch -t $(date -j -f "%Y%m%d%H%M" -v+$tz $photoDate +%Y%m%d%H%M) "$mediaFile"
		#echo "$(date +%Y-%m-%d\ %H:%M:%S) Success: "$mediaFile" has updated date $photoDate" >> "$log"
		else
		echo "$(date +%Y-%m-%d\ %H:%M:%S) Error: "$mediaFile" has bad date $photoDate" >> "$log"
		fi
	#test if the file has valid video extention
	elif [[ "$mediaFile" =~ ^(.*)(\.(M|m)(P|p)4)$ ]] || [[ "$mediaFile" =~ ^(.*)(\.(M|m)(O|o)(V|v))$ ]] || [[ "$mediaFile" =~ ^(.*)(\.(M|m)(K|k)(V|v))$ ]] ; then
	#retrieve all date metadata, sort in ascending order and trim
	videoDate=$(exiftool -s "$mediaFile" | grep Date | tr -d : |  awk '{print $2$3}' | sort -ni | head -n1 | cut -c1-12)
		#test if date is not null or greater than 0
		if [[ -n $videoDate ]] && [[ $videoDate -gt 0 ]] ; then
		#overwrite CreateDate
		touch -t $(date -j -f "%Y%m%d%H%M" -v+$tz $videoDate +%Y%m%d%H%M) "$mediaFile"
		#echo "$(date +%Y-%m-%d\ %H:%M:%S) Success: "$mediaFile" has updated date $videoDate" >> "$log"
		else
		echo "$(date +%Y-%m-%d\ %H:%M:%S) Error: "$mediaFile" has bad date $videoDate" >> "$log"
		fi
	#write error to log
	else
	echo "$(date +%Y-%m-%d\ %H:%M:%S) Error: "$mediaFile" has incompatible media extention" >> "$log"
	fi
done
