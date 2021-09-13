#!/bin/bash
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
source tmp_bash
cd "$dir"
mkdir -p ../_TRASH_TEMP/RSYC_TRASH/Back_TMP
RsyncBackup=`date +%Y-%m-%d_%Hh%Mm%Ss-BACKUP_RSYNC`
START_TIME=`date +%Y-%m-%d:%H:%M:%S`
echo "${green}
                                88888888b.   .d8888b.Y88b   d88P 888b    888  .d8888b.
                                888   Y88b d88P  Y88b Y88b d88P  8888b   888 d88P  Y88b
                                888    888 Y88b.       Y88o88P   88888b  888 888    888
                                888   d88P   Y888b.     Y888P    888Y88b 888 888
                                8888888P       Y88b.     888     888 Y88b888 888
                                888888    888   T88b     888     888  Y88888 888    888
                                888  T88b  Y88b d88P     888     888   Y8888 Y88b  d88P
                                888   T88b  Y8888P       888     888    Y888  "Y8888P"
"

echo -e "---> ${white}\$START_TIME\t\t\t\t\t\t\t\t\t\t\t\t${orange}$START_TIME"
echo "${white}Start $START_TIME" >> RSync_SCRIPT.log

#rsync -trbaPt --log-file=RSync_SCRIPT.log --backup --backup-dir=../_TRASH_TEMP/RSYC_TRASH/Back_TMP --exclude-from 'RSYNC_BACKUP_Exclude.txt' zeus@zeus.local:/Volumes/Hyper_Speed/ /Volumes/RAID_13TO/_ZEUS_RSYNC/BACKUP_FROM_ZEUS --delete --update --progress | pv -lep -s 42 >> RSync_SCRIPT.log

# ON remote machine :
#sudo mkdir -p  /MOUNT_4TO/_TRASH_TEMP_RSYNC
# sudo chmod -R 777  /MOUNT_4TO/"_TRASH_TEMP_RSYNC"

#rsync -trbaPt -e "ssh -p 1000" --log-file=RSync_SCRIPT.log --backup --backup-dir=/MOUNT_4TO/_TRASH_TEMP_RSYNC/Back_TMP --include="*.jpg" --include="*.png" --include="*.mp4" --include="*.srt" --exclude="*"  ../_Output/ lab@192.168.1.151:/MOUNT_4TO/_Output --delete --update
rsync -trbaPt -e "ssh -p 1000" --include='*.jpg' --include='*.mp4' --include='*.srt' --include='*/' --exclude='*' --log-file=RSync_SCRIPT.log --backup --backup-dir=/MOUNT_4TO/_TRASH_TEMP_RSYNC/Back_TMP ../_Output/ bob@192.168.1.160:/MOUNT_4TO/_Output --delete --update | pv -lep -s 42 >/dev/null>> RSync_SCRIPT.log
#| pv -lep -s 42
echo "---> ${green}Rsync DONE${white}"
#mv ../_TRASH_TEMP/RSYC_TRASH/Back_TMP ../_TRASH_TEMP/RSYC_TRASH/"$RsyncBackup"

END_TIME=`date +%Y-%m-%d:%H:%M:%S`
#find /Volumes/RAID_13TO/_ZEUS_RSYNC/TO_TRASH_FROM_ZEUS/ -name ".DS_Store" -delete
#find /Volumes/RAID_13TO/_ZEUS_RSYNC/TO_TRASH_FROM_ZEUS/ *-BACKUP_ZEUS -depth -type d -exec rmdir {} \; 2>/dev/null
echo "${reset}finish $END_TIME" >> RSync_SCRIPT.log
echo "
####### ### #     # ###  #####  #     # ####### ######
#        #  ##    #  #  #     # #     # #       #     #
#        #  # #   #  #  #       #     # #       #     #
#####    #  #  #  #  #   #####  ####### #####   #     #
#        #  #   # #  #        # #     # #       #     #
#        #  #    ##  #  #     # #     # #       #     #
#       ### #     # ###  #####  #     # ####### ######

---------------------------------------------------------
################### Check console log ###################

cat RSync_SCRIPT.log

#########################################################
" >> RSync_SCRIPT.log
exit 0


cd -
