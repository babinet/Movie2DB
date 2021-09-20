#!/bin/bash
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
cd $dir &>/dev/null
rm tmp_bash
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
' > tmp_bash
source tmp_bash
echo "${bg_blue}${white}JE SUIS IMDB_ENCODE_ID.sh ${reset}"


# For _VO.mp4
for file_mp4 in ../tt*.mp4;
do

if [ -f servers/PHP-IMDB/posters/*.jpg ]
then
echo "${orange}---> Suppression des fichiers temporaires${red}"
sudo rm -R servers/PHP-IMDB/posters/*
fi
if [ -f ./.film_id ]
then
rm ../.film_id
fi

if [ -d ../.tmp ]
then
echo -e "${white}---> Check directory \t${orange} ../.tmp\t ${red}\t\t\t\t\t\t\t\tTo be removed...${reset}"
else
echo -e "${white}---> Creating directory ${orange} ../.tmp\t\t\t\t\t\t\t${green}ok${reset}";
mkdir -m 777 ../.tmp;
fi

if [ -d  ../_TRASH_TEMP/SRT/ ]
then
echo -e "${white}---> Check directory \t${orange} ../_TRASH_TEMP/SRT/ directory ${green}\t\t\t\t\t\t\tIs present${reset}"
else
echo "${orange}---> Creating ../.tmp directory${reset}";
mkdir -p -m 777 ../_TRASH_TEMP/SRT/
fi
if [ -d  ../_TRASH_TEMP/MP4 ]
then
echo -e "${white}---> Check directory \t${orange} ../_TRASH_TEMP/MP4${green}\t\t\t\t\t\t\t\tIs present${reset}"
else
echo "${white}---> Creating ${orange}../.tmp directory${reset}";
mkdir -p -m 777 ../_TRASH_TEMP/SRT/ ../_TRASH_TEMP/MP4/ ../_Output ../
.tmp
fi

# Definitions
simple_name=$(
echo $file_mp4 | sed 's/^.\{3\}//' | sed 's/.\{4\}$//' | tr ' ' '_'
)
echo -e "${white}---> \$simple_name\t\t\t\t\t\t\t\t\t\t\t${orange}$simple_name${reset}"

file_no_ext=$(
echo "$simple_name"
)

mkdir -p  ../.fields_names/$imdb_ID"_"$Year/$imdb_ID"_"$Year"_imdb_Fields/"
echo -e "${white}---> \$file_no_ext\t\t\t\t\t\t\t\t\t\t\t${orange}$file_no_ext${reset}"

file_tmp=$(
echo ../$file_no_ext | sed -e 's/_VO*$//g'
)

imdb_ID="$file_no_ext"

# Recherche
echo -e "${white}---> Recherche de :\t\t\t\t\t\t\t\t\t\t\t${orange}$imdb_ID${white}${orange}$Year${reset}"
awk -F'|' -v "le_nom_complet"="$imdb_ID" '$1=='le_nom_complet'' Cleaned_db/title.basics_movie.csv > ../.Temp.film
OutputCSV=$(cat ../.Temp.film)
echo -e "${white}---> ####\t\t\t\t\t\t${orange}../.Temp.film\t\t\t\t\t\t${white}####"

output_resultat=$(echo $OutputCSV | tr "\n" "@" | awk -F'|' '{print"---> "$1"\t"$2"\t\ "$3"\t"$4"\t"$6"\t"$7"\n"}'  | tr "@" "\n")
echo "${whithe}$output_resultat"

#
#
# Début de l'asemblage.
awk -v FS="|" '{print $1}' ../.Temp.film > ../.film_id
if [ -s ../.film_id ]
then


if [ -d ../.tmp ]
then
echo -e "${bg_red}${white}---> ⚠️ "\ " Removing ${orange} ../.tmp/ ../.fields_names/ ../.film_id ${white}? <---                                                 ${reset}${red}"
sudo rm  -R ../.tmp ../.fields_names/ ../.film_id
fi


if [ -d ../.tmp ]
then
echo -e "${white}---> The ../.tmp directory\t\t\t\t\t\t\t\t\t${red}Was not removed"
else
echo -e "${white}---> Creating a fresh new & empty\t\t\t\t\t\t\t\t\t${orange}📁 ../.tmp directory";
mkdir -p ../.tmp;
fi

if [ -d ../.fields_names ]
then
echo -e "---> Removing\t\t\t\t\t\t\t\t\t\t\t\t\t${red}../.fields_names directory"
sudo rm -R ../.fields_names;
fi
if [ -d ../.fields_names ]
then
echo "${red}---> The directory ../.fields_names was not removed${reset}"
else
echo -e "${white}---> Creating directory\t\t\t\t\t\t\t\t\t\t\t${orange}../.fields_names"
mkdir -p ../.fields_names
fi

echo -e "${white}---> The ../.Temp.film ${orange}\t\t\t\t\t\t\t\t\t\t\t../.Temp.film ${white}is like this :"
cat ../.Temp.film

echo "${bg_green}${white}
####################################################################################################################
#    🎬 OK ! "$Title_Name" was found on IMDB $infoimdb
####################################################################################################################${reset}${white}"
awk -v FS="|" '{print $1}' ../.Temp.film > ../.film_id
echo -e "${white}---> Déplacer l'ID vers${orange}\t\t\t\t\t\t\t\t\t\t\t../.fields_names/imdb_ID"
infoimdb_tmp=$(
cat ../.film_id
)
echo -e "${white}---> Création du fichier\t\t\t\t\t\t\t\t\t\t${orange}../.fields_names/imdb_ID_$infoimdb_tmp.txt"
cp  ../.film_id ../.fields_names/imdb_ID_"$infoimdb"_tmp.txt

imdb_ID=$(
cat ../.fields_names/imdb_ID_"$infoimdb"_tmp.txt
)
echo -e "${white}---> Création de la nouvelle ID\t\t\t\t\t\t\t$imdb_ID\t\t${orange}$imdb_ID${reset}"
echo -e "${white}---> Création de l ID à partir du nom du\t\t\t\t\t\t\t\t${orange}$file_mp4${reset}"

echo -e "${white}---> Déplacement de\t\t\t\t${orange}$file_mp4 ${white}vers\t\t\t\t\t${orange}../"$imdb_ID".mp4${reset}"
imdb_ID_file=$(
echo $imdb_ID.mp4
)

echo -e "${white}---> Generating the\t\t\t\t\t\t\t\t\t\t\t${orange}../.tmp/$imdb_ID"_TXT.php"";
cp servers/PHP-IMDB/TXT_PROC/Template_ALL.php ../.tmp/$imdb_ID"_TXT.php"
sed -ie 's|FILM TITLE OR IMDB ID|'$imdb_ID'|g' ../.tmp/$imdb_ID"_TXT.php"
sed -ie 's|STRING TO REPLACE|getAll()|g' ../.tmp/$imdb_ID"_TXT.php"



if [ -f ../$imdb_ID.jpg ]||[ -f ../$simple_name ]
then
echo -e "${white}---> Le poster ${orange}../$imdb_ID.jpg${white} remplace le poster original dans\t\t\t:\t\t ${orange}../$imdb_ID.jpg servers/PHP-IMDB/posters/"
sudo cp ../$imdb_ID.jpg servers/PHP-IMDB/posters/*.jpg
sudo chmod 777 servers/PHP-IMDB/posters/*.jpg
else
echo "${white}---> Getting the poster from Amazone${green}"
sudo -u _WWW php -f ../.tmp/$imdb_ID"_IMG.php"
sudo rm servers/PHP-IMDB/cache/*
echo -e "${white}---> Generating the\t\t\t\t\t\t\t\t\t\t\t${orange}../.tmp/$imdb_ID"_IMG.php"";
cp servers/PHP-IMDB/TXT_PROC/Template_ALL.php ../.tmp/$imdb_ID"_IMG.php"
sed -ie 's|FILM TITLE OR IMDB ID|'$imdb_ID'|g' ../.tmp/$imdb_ID"_IMG.php"
sed -ie 's|STRING TO REPLACE|getPoster(\$sSize = '"'big'"', \$bDownload = true)|g' ../.tmp/$imdb_ID"_IMG.php"

echo -e "${white}---> sudo su www-data php sending queries to IMDB${orange}\t\t\t\t\t\twww.imdb.com/$imdb_ID"
echo "${white}---> Getting the poster from Amazone${green}"
sudo -u _WWW php -f ../.tmp/$imdb_ID"_IMG.php"
sudo rm servers/PHP-IMDB/cache/*
fi
echo -e "
${white}---> Getting the Fields from PHP in\t\t\t\t\t\t\t\t\t${orange}../.fields_names/$imdb_ID"_ALL.txt""
mkdir -p ../.fields_names/$imdb_ID/
sudo -u _WWW php -f ../.tmp/$imdb_ID"_TXT.php" > ../.fields_names/$imdb_ID"_ALL.txt"
echo -e "${white}---> supression des raw php => (()) dans le fichier\t\t\t\t\t\t\t${orange}$imdb_ID"_ALL.txt""
awk -F" => " '{print $2}' ../.fields_names/$imdb_ID"_ALL.txt" > ../.fields_names/$imdb_ID"out_awk_tmp.txt"
echo -e "${white}---> Ajout de virgules comme délimitteurs :\t\t\t\t\t\t\t\t${orange}../.fields_names/"$imdb_ID"_Fields_ready.txt"
awk -v FS="Array" -v RS= -v OFS="@" '{$1 = $1} 1' ../.fields_names/$imdb_ID"out_awk_tmp.txt" > ../.fields_names/$imdb_ID"_Fields_ready.txt"

echo -e "${white}---> Trouver les célulles contenant les champs pour tagger l'encodage\t\t\t\t\t${orange}MP4"

awk '/Director\n/' RS="@"  OFS=\| ../.fields_names/$imdb_ID"_Fields_ready.txt" > ../.fields_names/$imdb_ID/$imdb_ID"_Director.txt"
awk '/Akas\n/' RS="@"  OFS=\| ../.fields_names/$imdb_ID"_Fields_ready.txt" > ../.fields_names/$imdb_ID/$imdb_ID"_Akas.txt"
echo "awk -F\\| '"\$1"=="\"$imdb_ID\"" ' Cleaned_db/title.basics_movie.csv > ../.fields_names/$imdb_ID/$imdb_ID"_Out_Basics_row.csv"" > ../.tmp/$imdb_ID"_Orig_name.sh"
# Je rends executable "au_name.sh"
chmod +x ../.tmp/$imdb_ID"_Orig_name.sh"
# J'execute
../.tmp/$imdb_ID"_Orig_name.sh"
awk -v FS="|" '{print $3}' ../.fields_names/$imdb_ID/$imdb_ID"_Out_Basics_row.csv" > ../.fields_names/$imdb_ID/$imdb_ID"_Orig_name.txt"

Year=$(awk -v FS="|" '{print $6}' ../.fields_names/"$imdb_ID"/"$imdb_ID"_Out_Basics_row.csv)

awk '/Title\n/' RS="@"  OFS=\| ../.fields_names/$imdb_ID"_Fields_ready.txt" | awk 'NF > 0' | tr "\n" "|" | awk -F'\[value\] \=\>' '{print $1}' | awk -F'|' '{print $2}' > ../.tmp/TitleFR.txt  #| awk /\[value\]/ #> .fields_names/$imdb_ID/$imdb_ID"_TrailerAsUrl.txt"
TitleFR=$(cat ../.tmp/TitleFR.txt)
echo -e "${white}---> \$TitleFR\t\t\t\t\t\t\t\t\t\t\t\t${orange}$TitleFR${reset}"
Director=$(
awk 'FNR == 3 {print}' ../.fields_names/$imdb_ID/$imdb_ID"_Director.txt"
)

name=$(
cat ../.fields_names/$imdb_ID/$imdb_ID"_Orig_name.txt"
)
name_no_space=$(
echo $name | tr -s ' ' | tr ' ' '_'
)
mkdir -p ../.fields_names/$imdb_ID"_"$Year/$imdb_ID"_"$Year"_stills" ../.fields_names/$imdb_ID"_"$Year/$imdb_ID"_"$Year"_posters" ../.fields_names/$imdb_ID"_"$Year/$imdb_ID"_"$Year"_shtg" ../.fields_names/$imdb_ID"_"$Year/$imdb_ID"_"$Year"_Fields"
mv $file_mp4 ../$imdb_ID.mp4
#echo $imdb_ID
echo -e "${white}---> Supression des sous titres du fichier\t\t\t\t\t${orange}../$imdb_ID.mp4 >\t../.tmp/$imdb_ID"_TEMP.mp4""
ffmpeg -hide_banner -loglevel panic -i ../$imdb_ID.mp4 -sn -c copy ../.tmp/$imdb_ID"_TEMP.mp4"
echo -e "${white}---> Encodage conditionel\t\t\t\t\t\t\t\t\t\t${orange}ffmpeg"

if [ -f ../"$imdb_ID"_"$Year"_VO.srt ]
then
echo -e "${white}---> 🇫🇷 There is subtitles \t\t\t\t\t\t${green}$file_no_ext.srt"
mv ../"$imdb_ID"_"$Year"_VO.srt ../$imdb_ID.srt
fi

if [ -f ../$imdb_ID.srt ]
then
echo -e "${white}---> Le fichier ${orange}\t../"$imdb_ID".srt ${white}est présent - Encodage de\t ${orange}$name >\t../.tmp/"$imdb_ID"_TEMP.mp4";

ffmpeg -hide_banner -loglevel panic -i ../.tmp/$imdb_ID"_TEMP.mp4" -i ../$imdb_ID.srt -metadata Title="$name - $TitleFR" -metadata Date="$Year" -metadata Artist="$Director" -metadata Description="IMDB ID = $imdb_ID" -c copy -c:s mov_text -map 0:0 -map 0:1 -map 1:0 -y -metadata:s:s:0 language=fre ../.fields_names/$imdb_ID"_"$Year/$imdb_ID"_"$Year.mp4
else
echo -e "${white}---> Le fichier ${orange}$imdb_ID.srt\t\t\t\t\t\t\t\t\t\t${red}N'est pas présent"
ffmpeg -hide_banner -loglevel panic -i ../.tmp/$imdb_ID"_TEMP.mp4" -metadata Title="$name - $TitleFR" -metadata Date="$Year" -metadata Artist="$Director" -metadata Description="IMDB ID = $imdb_ID" -c copy ../.fields_names/$imdb_ID"_"$Year/$imdb_ID"_"$Year.mp4
fi

echo -e "${white}---> \$imdb_ID\t\t\t\t\t\t\t\t\t\t\t\t${orange}$imdb_ID"
# Director
echo -e "${white}---> Split des columns director avec ' / ' comme separateurs vers 4x directors\t\t\t\t${orange}director1|director2|etc."
awk -F ' / ' '{ print $1, $2, $3, $4}' OFS="|" ../.fields_names/$imdb_ID/$imdb_ID"_Director.txt" > ../.tmp/director_tmp00.txt
awk '{if (NR!=1) {print}}' ../.tmp/director_tmp00.txt > ../.tmp/director_tmp01.txt
sed -i.bak "1 s/^.*$/director1|director2|director3|director4/" ../.tmp/director_tmp01.txt
sed -i '' -e '$ d' ../.tmp/director_tmp01.txt

if [ -f ../$imdb_ID"_"$Year.srt ]
then
echo -e "${white}---> Placement du SRT dans ${orange}\t$imdb_ID"_"$Year/$imdb_ID"_"$Year.srt"
cp ../_TRASH_TEMP/SRT/$imdb_ID"_"$Year.srt ../.fields_names/$imdb_ID"_"$Year/$imdb_ID"_"$Year".srt"
mv ../$imdb_ID"_"$Year.srt ../_TRASH_TEMP/SRT/$imdb_ID"_"$Year"_"$FileDate.srt
echo -e "${white}---> Subtitle detected\t\t\t ${orange}../$imdb_ID"_"$Year.srt"
fi

echo -e "${white}---> \$Year \t\t\t\t\t\t\t${orange}\t\t\t\t\t$Year${reset}"
cp ../.Temp.film ../.fields_names/"$imdb_ID"_"$Year"/"$imdb_ID"_"$Year".title.basic.txt


ffprobe -hide_banner -loglevel panic -select_streams v -show_streams ../"$imdb_ID".mp4 > ../.tmp/"$imdb_ID"totalframes_tmp_01.txt
sed -n '/nb_frames\=/,$p' ../.tmp/"$imdb_ID"totalframes_tmp_01.txt | awk '/^nb_frames\=/' | awk '{gsub(/nb_frames\=/,"");}1' > ../.tmp/"$imdb_ID"totalframes.txt
nb_frames=$(cat ../.tmp/"$imdb_ID"totalframes.txt)

echo -e "${white}---> \$file_no_ext.mp4 total frames\t\t\t\t\t\t\t\t\t${orange}"$nb_frames""
Strill_frame_extract_nbr=$(($nb_frames / 12))
ffmpeg -hide_banner -loglevel panic -i ../"$imdb_ID".mp4 -vsync 0 -vf "select='not(mod(n,$Strill_frame_extract_nbr))'" ../.fields_names/$imdb_ID"_"$Year/$imdb_ID"_"$Year"_stills/"$imdb_ID"_"$Year"_stills_"%04d.jpg
rm ../.fields_names/"$imdb_ID"_"$Year"/"$imdb_ID"_"$Year"_stills/*0001.jpg ../.fields_names/"$imdb_ID"_"$Year"/"$imdb_ID"_"$Year"_stills/*0013.jpg

echo -e "${white}---> Déplacement du poster de ${orange}servers/PHP-IMDB/posters ${white}vers\t\t\t\t\t\t${orange}$imdb_ID"_"$Year"_A_poster.jpg""
sudo mv servers/PHP-IMDB/posters/*.jpg ../.fields_names/"$imdb_ID"_"$Year"/"$imdb_ID"_"$Year"_posters"/"$imdb_ID"_"$Year"_A_poster.jpg"

echo "${white}---> Making folder's Icon with osxiconutils"
servers/osxiconutils/image2icns ../.fields_names/$imdb_ID"_"$Year/$imdb_ID"_"$Year"_posters"/$imdb_ID"_"$Year"_A_poster.jpg"  servers/osxiconutils/tmp.icns
servers/osxiconutils/seticon servers/osxiconutils/tmp.icns ../.fields_names/$imdb_ID"_"$Year
rm servers/osxiconutils/tmp.icns

cp ../.fields_names/$imdb_ID"_ALL.txt" ../.fields_names/$imdb_ID"_"$Year/$imdb_ID"_"$Year"_source_imdb.txt"
cp ../.film_id ../.fields_names/$imdb_ID"_"$Year/$imdb_ID"_"$Year"_ID.txt"
echo "$name $Year" >> ../.fields_names/$imdb_ID"_"$Year/$imdb_ID"_"$Year"_ID.txt"

if [ -d ../_Output/"$imdb_ID"_"$Year" ]
then
echo -e "${white}---> Moving of ${orange}../_Output/"$imdb_ID"_"$Year" ${white}to\t\t\t\t\t\t\t${orange}../_TRASH_TEMP/OLD_REPLACED/"$imdb_ID"_"$Year"_"$FileDate"${green}"
mkdir -p ../_TRASH_TEMP/OLD_REPLACED
mv ../_Output/"$imdb_ID"_"$Year" ../_TRASH_TEMP/OLD_REPLACED/"$imdb_ID"_"$Year"_"$FileDate"
python servers/finder_colors.py red ../_TRASH_TEMP/OLD_REPLACED/"$imdb_ID"_"$Year"_"$FileDate"
fi
echo -e "${white}---> Deplacecemnt de\t\t${orange}../.fields_names/"$imdb_ID"_"$Year" ${white}dans\t\t\t\t\t${orange}../_Output/"
mv ../.fields_names/"$imdb_ID"_"$Year" ../_Output/"$imdb_ID"_"$Year"
python servers/finder_colors.py green ../_Output/"$imdb_ID"_"$Year"
echo -e "${white}---> Déplacement de la source ${ornange}../$file_no_ext.mp4 vers\t\t\t\t\t\t\t${red}../_TRASH_TEMP/MP4/"$imdb_ID"_"$Year"_"$FileDate".mp4"
mv ../$imdb_ID.mp4 ../_TRASH_TEMP/MP4/"$imdb_ID"_"$Year"_"$FileDate".mp4

if [ -f ../$imdb_ID.srt ]
then
cp ../$imdb_ID.srt ../_Output/"$imdb_ID"_"$Year"/"$imdb_ID"_"$Year".srt
mv ../$imdb_ID.srt ../_TRASH_TEMP/SRT/"$imdb_ID"_"$Year"_"$FileDate".srt
fi

echo -e "
${white}####################################################################################################################
${white}Film\t\t\t:${orange} $name
${white}Année\t\t\t:${orange} $Year
${white}Titre Fançais\t\t:${orange} $TitleFR
${white}Réalisé par\t\t${orange}: $Director
${white}Nombre d'images\t\t: ${orange}"$nb_frames" images
${white}Was encoded in folder\t: ${orange}"$imdb_ID"_"$Year"
${white}With the file\tname\t:${orange} "$imdb_ID"_"$Year".mp4
${white}With the subtitles\t:${orange} "$imdb_ID"_"$Year".srt
${white}The CSV of the film\t:${orange} "$imdb_ID"_"$Year".csv
${white}The INDB source txt\t:${orange} "$imdb_ID"_"$Year"_source_imdb.txt
${white}The poster is under\t:${orange} "$imdb_ID"_"$Year"/"$imdb_ID"_"$Year"_posters/
${white}With the name\t\t:${orange} "$imdb_ID"_"$Year"_A_poster.jpg
${white}The stills images are\t:${orange} "$imdb_ID"_"$Year"/"$imdb_ID"_"$Year"_stills/"$imdb_ID"_"$Year"_stills_##.jpg${white}
####################################################################################################################
${reset}"
echo -e "${bg_red}${white}----> ⚠️ "\ " Suppression des dossiers ../.fields_names et ../.tmp <----                                                   ${reset}"
# rm -R ../.fields_names/ ../.tmp
echo "${green}Done!
${white}Next?${reset}"

else
echo "
${bg_red}${white}
####################################################################################################################
####  ⚠️ "\ "Warning  ! Nothing was not found !
####################################################################################################################${reset}
"
fi
done

#all_films_csvs=$(
#find ../_Output/ -name '*.csv' -exec echo {} +
#)
#awk 'FNR==1 && NR!=1{next;}{print}' $all_films_csvs > MASTER_MOVIES_CSV.csv


cd -
