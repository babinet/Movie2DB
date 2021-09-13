#/bin/bash!
orange=`tput setaf 11`
bg_orange=`tput setab 178`
purple=`tput setaf 13`
Line=`tput smul`
bold=`tput bold`
black=`tput setaf 0`
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 15`
reset=`tput sgr0`
bg_red=`tput setab 1`
bg_green=`tput setab 2`
bg_white=`tput setab 7`
bg_blue=`tput setab 4`
lightblue=`tput setaf 45`
lightgreen=`tput setaf 46`
bleuetern=`tput setaf 45`
ilghtpurple=`tput setaf 33`
lightred=`tput setaf 161`
darkblue=`tput setaf 19`
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
cd $dir
echo "
                    ${lightred} ##     ##  #######  ##     ## #### ########  #######  ########  ########
                    ${red} ###   ### ##     ## ##     ##  ##  ##       ##     ## ##     ## ##     ##
                    ${green} #### #### ##     ## ##     ##  ##  ##              ## ##     ## ##     ##
                    ${lightgreen} ## ### ## ##     ## ##     ##  ##  ######    #######  ##     ## ########
                    ${bleuetern} ##     ## ##     ##  ##   ##   ##  ##       ##        ##     ## ##     ##
                    ${ilghtpurple} ##     ## ##     ##   ## ##    ##  ##       ##        ##     ## ##     ##
                    ${darkblue} ##     ##  #######     ###    #### ######## ######### ########  ########
"

echo "${white}---> Checking install & datas..."

#Check
if [[ -f servers/osxiconutils/icns2image ]]
then
echo -e "${green}---> Osxiconutils is installed in :${orange}\t\t\t\t\t\t\t\tservers/osxiconutils"
else
echo "${orange}--->Installing Osxiconutils in servers/osxiconutils"
mkdir -p servers/osxiconutils servers/osxiconutils/temp
wget -O servers/osxiconutils.zip https://sveinbjorn.org/files/software/osxiconutils.zip
unzip servers/osxiconutils.zip -d servers/osxiconutils/temp
cp -Rap servers/osxiconutils/temp/bin/* servers/osxiconutils/
rm -R servers/osxiconutils/temp servers/osxiconutils.zip
chmod +x servers/osxiconutils/image2icns servers/osxiconutils/seticon servers/osxiconutils/icns2image servers/osxiconutils/geticon
fi


#read input_variable
#echo "You entered: $input_variable"
#
menu_from_array ()
{

select item; do
# Check menu item number
if [ 1 -le "$REPLY" ] && [ "$REPLY" -le $# ];

then
echo "Vous avez selectioné $item"
break;
else
echo "Erreur - Choisir parmis 1-$#"
fi
done
}

# Declare the array
linux=('IMDB_ENCODE' 'HTML_GEN' 'IMDB_TO_WIKIPEDIA' 'ListFilmNPeople' 'LIST_FILES' 'RSYNC_OUTPUT' 'INSTALL' 'KeepOneZIPOnly' 'Lock' 'UnLock' 'DeleteFields')

# Call the subroutine to create the menu
menu_from_array "${linux[@]}"

if [ $item.sh = IMDB_ENCODE.sh ]
then
./IMDB_ENCODE.sh
fi

if [ $item.sh = HTML_GEN.sh ]
then
./HTML_GEN.sh
fi
if [ $item.sh = IMDB_TO_WIKIPEDIA.sh ]
then
./IMDB_TO_WIKIPEDIA.sh
fi
if [ $item.sh = ListFilmNPeople.sh ]
then
./ListFilmNPeople.sh
fi
if [ $item.sh = INSTALL.sh ]
then
./INSTALL.sh
fi
if [ $item = KeepOneZIPOnly ]
then
for DirectoryZips in `find ../_Output/*/*/*_Fields/ -type d -name "ZIPS"`
do
echo -e "${white}---> Keeping only 1 (ONE) Zip in $DirectoryZips - ${red} Deleting all older zips"
ls -t "$DirectoryZips"/*.zip | tail -n +2 | xargs rm --
done

fi
if [ $item = DeleteFields ]
then
for DirectoryZips in `find ../_Output/*/*/ -type d -name *_Fields`
do
echo -e "${red}---> Deleteing ALL Fields directories"
rm -R "$DirectoryZips"
done
fi

if [ $item = Lock ]
then
echo -e "${White}---> Creating Lockfiles ${red}#Done${white} in\t\t\t${orange}../Output/*/${red}#Done${white}"
touch ../_Output/_NEXT_IMPORT/\#DONE ../_Output/0_9/\#DONE ../_Output/A/\#DONE ../_Output/B/\#DONE ../_Output/C/\#DONE ../_Output/D/\#DONE ../_Output/E/\#DONE ../_Output/F/\#DONE ../_Output/G/\#DONE ../_Output/H/\#DONE ../_Output/I/\#DONE ../_Output/J/\#DONE ../_Output/K/\#DONE ../_Output/L/\#DONE ../_Output/M/\#DONE ../_Output/N/\#DONE ../_Output/O/\#DONE ../_Output/P/\#DONE ../_Output/Q/\#DONE ../_Output/R/\#DONE ../_Output/S/\#DONE ../_Output/T/\#DONE ../_Output/The_A-C/\#DONE ../_Output/The_D-E/\#DONE ../_Output/The_F-I/\#DONE ../_Output/The_J-N/\#DONE ../_Output/The_O-P/\#DONE ../_Output/The_Q-Z/\#DONE ../_Output/TT_00/\#DONE ../_Output/U/\#DONE ../_Output/V/\#DONE ../_Output/W/\#DONE ../_Output/X/\#DONE ../_Output/Y/\#DONE ../_Output/Z/\#DONE ../_Output/_NEXT_IMPORT\#DONE ../_Output/_Documentaires/\#DONE ../_Output/_SERIES/\#DONE ../_Output/_NEW/\#DONE
fi
if [ $item = UnLock ]
then
echo -e "${White}---> Deleteing All Lockfiles ${red}#Done${white} in\t\t\t${orange}../Output/*/${red}#Done${white}"
rm ../_Output/_NEXT_IMPORT/\#DONE ../_Output/0_9/\#DONE ../_Output/A/\#DONE ../_Output/B/\#DONE ../_Output/C/\#DONE ../_Output/D/\#DONE ../_Output/E/\#DONE ../_Output/F/\#DONE ../_Output/G/\#DONE ../_Output/H/\#DONE ../_Output/I/\#DONE ../_Output/J/\#DONE ../_Output/K/\#DONE ../_Output/L/\#DONE ../_Output/M/\#DONE ../_Output/N/\#DONE ../_Output/O/\#DONE ../_Output/P/\#DONE ../_Output/Q/\#DONE ../_Output/R/\#DONE ../_Output/S/\#DONE ../_Output/T/\#DONE ../_Output/The_A-C/\#DONE ../_Output/The_D-E/\#DONE ../_Output/The_F-I/\#DONE ../_Output/The_J-N/\#DONE ../_Output/The_O-P/\#DONE ../_Output/The_Q-Z/\#DONE ../_Output/TT_00/\#DONE ../_Output/U/\#DONE ../_Output/V/\#DONE ../_Output/W/\#DONE ../_Output/X/\#DONE ../_Output/Y/\#DONE ../_Output/Z/\#DONE ../_Output/_Documentaires/\#DONE ../_Output/_SERIES/\#DONE ../_Output/_NEW/\#DONE
fi


if [ $item = LIST_FILES ]
then
echo -e "${white}---> Listing ALL JPGs & MP4 with path to import in Drupal 8${orange}\t\t\t\t_Otput"

read -p "${orange}---> ⚠️\ This may take half an hour ⚠️\ <---
${red}---> Y/${green}N${white} ? : " answer
case ${answer:0:1} in
y|Y )
echo Yes
./ListFolder.sh
;;
* )
echo No
;;
esac

fi

if [ $item = RSYNC_OUTPUT ]
then
ttalweight=$(df -h ../_Output)
echo -e "${white}---> The total weigt of the files to sync is $ttalweight MO --> Drupal 8${orange}\t\t\t\t_Otput"
echo ${white}"
                                 #     #    #    ######  #     # ### #     #  #####
                                 #  #  #   # #   #     # ##    #  #  ##    # #     #
                                 #  #  #  #   #  #     # # #   #  #  # #   # #
                                 #  #  # #     # ######  #  #  #  #  #  #  # #  ####
                                 #  #  # ####### #   #   #   # #  #  #   # # #     #
                                 #  #  # #     # #    #  #    ##  #  #    ## #     #
                                  ## ##  #     # #     # #     # ### #     #  #####"
echo -e "${white}\t\t\t\t    ---> Check the detination in rsync.sh <---"
read -p "${orange}                                        ---> ⚠️\ This may take time ⚠️\ <---
${red}---> Y/${green}N${white} ? : " answer
case ${answer:0:1} in
y|Y )
echo Yes
./rsync.sh
;;
* )
echo No
;;
esac

fi


cd - 

