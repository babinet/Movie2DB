
#!/bin/bash
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
cd $dir
CurentIP=$(
ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
)
Hostname_local=$(
hostname -fs
)

# variable
printf 'orange=`tput setaf 11`
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
FileDate=$(echo $(date +%%Y_%%m_%%d_%%Hh%%Mm%%Ss) | tr "/" "_")

' >> tmp_bash
source tmp_bash
echo "${bg_red}${white}JE SUIS INSTALL.sh${reset}"
# Check files html2csv = https://sebsauvage.net/python/html2csv.py
# Fetch output
# Menu A B C
if ! [ -x "$(command -v wget)" ]; then
echo "${bg_green}${white}
############################
#    wget is installed     #
############################${reset}"
fi
if ! [ -x "$(command -v exiftool)" ]; then
echo "${bg_red}${white}###########                 Error: exiftool is not installed.                 ###########${reset}"
else
echo "${bg_green}${white}
############################
#  exiftool is installed   #
############################${reset}"
fi

if ! [ -x "$(command -v awk)" ]; then
echo "${bg_red}${white}###########                   Error: awk is not installed.                   ###########${reset}"
else
echo "${bg_green}${white}
############################
#     awk is installed     #
############################${reset}"
fi

if ! [ -x "$(command -v pv)" ]; then
echo "${bg_red}${white}###########                   Error: pv is not installed.                   ###########${reset}
${white}---> Install using ${orange}sudo port install pv"
else
echo "${bg_green}${white}
############################
#     pv is installed     #
############################${reset}"
fi


if [ -f servers/finder_colors.py ]
then
echo "${green}---> Finder_colors is installed"
else
echo "${green}---> Installing Finder_colors is servers"
wget https://files.pythonhosted.org/packages/b3/50/784dcf6e325978d6384a438cd50d4fbfc79f6cddcb481e7c0d80e5d78108/finder_colors-0.9.5.tar.gz
tar xvf finder_colors-0.9.5.tar.gz
mv finder_colors-0.9.5/setup.py servers/
mv finder_colors-0.9.5/finder_colors.py servers/
rm -R finder_colors-0.9.5*
fi

# Check et Install
#ffmpeg & Brew Check
if ! [ -x "$(command -v ffmpeg)" ]; then
echo "${bg_red}${white}###########                 Error: ffmpeg is not installed.                   ###########${reset}"

read -r -p "
${bg_red}${white}#########################################################################################${reset}
${bg_red}${white}#####                Do you want install Wget Ffmpeg & Exiftools ?                   ####${reset}
${bg_red}${white}#########################################################################################${reset}
${reset}
[Y/N] " input
case $input in
[yY][eE][sS]|[yY])
echo "${bg_blue}${white}--> Brew install ffmpeg wget & exiftools                                                                ${reset}"
if [[ -e /usr/local/bin/brew ]]; then
echo "${bg_green}${black}--> Brew is alredy installed                                                             ${reset}"
else
echo "${bg_blue}${white}--> installing homebrew for mac from https://brew.sh/index_fr${reset}"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
brew install install ffmpeg wget exiftools

;;
[nN][oO]|[nN])
echo "No"
;;
*)
echo "Invalid option !!"
exit 1
;;
esac
else
echo "${bg_green}${white}
############################
#   ffmpeg is installed    #
############################${reset}"
fi
### Check requirement
CheckHTML2CSV="_html2csv.py"
if test -f "$CheckHTML2CSV"; then
echo "${bg_green}${white}
############################
#   html2csv is present    #
############################${reset}"
else
echo "--> downloading html2csv as _html2csv.py"
wget -O _html2csv.py https://sebsauvage.net/python/html2csv.py
fi

sudo pip install xattr

#
## INFOS INSTALL
#
echo "${orange}
####################################################################
#    Wikipedia data: Go to Wiki-data get the database of french    #
#    articles on IMDB ID films                                     #
####################################################################
${reset}${bg_white}${blue}
####################################################################
#     https://query.wikidata.org
####################################################################${reset}

${purple}
SELECT ?item ?IMDb_ID ?sitelink WHERE {

?item wdt:P31 wd:Q11424 .

?item wdt:P345 ?IMDb_ID .

?sitelink schema:about ?item ; schema:isPartOf <https://fr.wikipedia.org/> .

}${reset}
${bg_white}${blue}
####################################################################
Save as .tsv rename _wikipedia_fr_imdb_id.tsv approx weight 5.6MO
####################################################################${reset}"



echo -e "${orange}####################################################################
#    Get the list of all films in the database login as postgres   #
####################################################################
${reset}${purple}
\tpsql -d film_db${white} from server lab${reset}${white}

Then at the prompt #

${reset}${purple}\tcopy (select * from node__field_imdb_id) to '/var/lib/postgresql/IMDBID.csv' header csv;${reset}

${white}Then export IMDBID.csv via scp

${purple}\tscp IMDBID.csv $USER@$CurentIP:"$dir"/${reset}


${orange}####################################################################
#   Get the list of all People in the database login as postgres   #
####################################################################
${reset}${purple}
\tpsql -d film_db${white} from server lab${reset}${white}

At the prompt #
${white}To get all the people already stored in the DB film_db GUID.csv
${purple}
\tcopy (select feeds_item_guid from taxonomy_term__feeds_item) to '/var/lib/postgresql/GUID.csv' header csv;"

echo -e "${white}\nThen export from machine lab the file GUID.csv via scp:
${purple}
\tscp GUID.csv $USER@$CurentIP:"$dir"/${reset}"

#read input_variable
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
linux=('Install_PHP_server' 'Install_DB' 'Install_Fat')

# Call the subroutine to create the menu
menu_from_array "${linux[@]}"

if [ $item.sh = Install_PHP_server.sh ]
then
./Install_PHP_server.sh
fi

if [ $item.sh = Install_DB.sh ]
then
./Install_DB.sh
fi

if [ $item.sh = Install_Fat.sh ]
then
./Install_Fat.sh
fi

mkdir -p ../_Output/_NEXT_IMPORT ../_Output/0_9 ../_Output/A ../_Output/B ../_Output/C ../_Output/D ../_Output/E ../_Output/F ../_Output/G ../_Output/H ../_Output/I ../_Output/J ../_Output/K ../_Output/L ../_Output/M ../_Output/N ../_Output/O ../_Output/P ../_Output/Q ../_Output/R ../_Output/S ../_Output/T ../_Output/The_A-C ../_Output/The_D-E ../_Output/The_F-I ../_Output/The_J-N ../_Output/The_O-P ../_Output/The_Q-Z ../_Output/TT_00 ../_Output/U ../_Output/V ../_Output/W ../_Output/X ../_Output/Y ../_Output/Z ../_Output/_NEW ../_Output/_SERIES ../_OUtput/_Serie2Process/ ../_Output/_NEXT_IMPORT ../_Output/_Documentaires ../_Output/_SERIES/

python servers/finder_colors.py blue ../_Output/_NEXT_IMPORT ../_Output/0_9 ../_Output/A ../_Output/B ../_Output/C ../_Output/D ../_Output/E ../_Output/F ../_Output/G ../_Output/H ../_Output/I ../_Output/J ../_Output/K ../_Output/L ../_Output/M ../_Output/N ../_Output/O ../_Output/P ../_Output/Q ../_Output/R ../_Output/S ../_Output/T ../_Output/The_A-C ../_Output/The_D-E ../_Output/The_F-I ../_Output/The_J-N ../_Output/The_O-P ../_Output/The_Q-Z ../_Output/TT_00 ../_Output/U ../_Output/V ../_Output/W ../_Output/X ../_Output/Y ../_Output/Z ../_Output/_NEW ../_Output/_NEXT_IMPORT ../_Output/_Documentaires
python servers/finder_colors.py red ../_OUtput/_Serie2Process/ ../_Output/_NEXT_IMPORT ../_Output/_Documentaires ../_OUtput/_SERIES/
touch ../_OUtput/_SERIES/\#DONE ../_Output/_NEW/\#DONE 
setfile -a V ../_Output/_SERIES/\#DONE

cd -
