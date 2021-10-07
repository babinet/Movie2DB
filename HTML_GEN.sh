#if [[ -f "/path/to/file" && -s "/path/to/file" ]]; then
#echo "exist and not empty"
#else
#echo "not exist or empty";
#fi
#

#!/bin/bash
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
cd "$dir"
# Needs to be encoded first
printf 'orange=`tput setaf 11`
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
FileDate=$(echo $(date +%%Y_%%m_%%d_%%Hh%%Mm%%Ss) | tr "/" "_")' > $dir/tmp_bash

source "$dir"/tmp_bash
echo -e "${white}---> Export des variables dans\t\t\t\t\t\t\t\t\t${orange}$dir/tmp_bash"
echo -e "${white}---> Home \$dir\t\t\t\t\t\t\t\t\t\t\t${orange}$dir"
echo "${bg_blue}${white}---> JE SUIS HTML_GEN.sh ${reset}"

for FileDone in ../_Output/*/
do
if [ -f "$FileDone"/#DONE ]
then
echo -e "${white}---> $FileDone contains ${red}#Done\t\t\t\t\t\t\t\t${orange}#DONE ${green}lockfile is present ${reset}"
echo -e "${white}---> $FileDone\t\t\t\t\t\t\t\t\t\t${bg_orange}${black}Will be ignored ${reset}"
else
echo -e "${green}---> To do : ${white}"


ls -d $FileDone/*/*title.basic.txt  | while read imdb_infomation
do
# Definitions des noms
simple_name_file=$(
echo "$imdb_infomation"
)
echo -e "${white}---> \$simple_name_file\t\t\t\t\t\t\t\t\t\t${orange}$simple_name_file"
# Le nom avec le chemin dans le dossier
file_no_ext_imdb=$(
sed 's/.\{16\}$//' <<< $imdb_infomation | sed 's/\/\//\//g'
)
# Le nom du fichier seul sans extenssion et sans chemin
simple_name=$(echo $file_no_ext_imdb | sed -n 's/[^/]*\///p')
mp4=$(ls $file_no_ext_imdb".mp4" | sed -n 's/[^/]*\///p' | awk '{print "..\/"$0}' )
#mp4=""$file_no_ext_imdb".mp4"
echo -e "${white}---> Create directory HTML\t\t\t\t\t\t\t\t\t${orange}"$file_no_ext_imdb"_Fields/HTML${reset}"
mkdir -p "$file_no_ext_imdb"_Fields/HTML""
mkdir -p "$file_no_ext_imdb"_Fields/ZIPS""
temp="$file_no_ext_imdb"_Fields""

mkdir -p $file_no_ext_imdb"_trailers"
mkdir -p "$file_no_ext_imdb"_mof
mkdir -p $temp/CSV_FIELDS
echo -e "${white}---> Create directory ZIPS\t\t\t\t\t\t\t\t\t${orange}"$file_no_ext"_imdb_Fields"
echo -e "${white}---> Create directory CSV\t\t\t\t\t\t\t\t\t${orange}$temp/CSV_FIELDS"
# Define id and title
id=$(awk -F\| '{print $1}' $imdb_infomation)
title=$(awk -F\| '{print $3}' $imdb_infomation)
# mp4
mp4HTML=$(echo $mp4 | sed 's:.*/::')
echo -e "${white}---> \$mp4HTML\t\t\t\t\t\t\t\t\t\t\t${orange}$mp4HTML"
printf "mp4
$mp4HTML
" > $temp/CSV_FIELDS/$id"_mp4.csv"

# title
title=$(awk -F'|' '{print $3}' $imdb_infomation)
printf "title
$title
" > $temp/CSV_FIELDS/$id"_title.csv"

# year
year=$(awk -F'|' '{print $6}' $imdb_infomation)
printf "year
$year
" > $temp/CSV_FIELDS/$id"_year.csv"

# print des variables
echo -e "${white}---> Procssing HTML segments with\t\t\t\t\t\t\t\t${green}awk${reset}"
echo -e "${white}---> \$title\t\t\t\t\t\t\t\t\t\t\t${orange}$title${reset}"
echo -e "${white}---> \$year\t\t\t\t\t\t\t\t\t\t\t${orange}$year${reset}"
echo -e "${white}---> \$id\t\t\t\t\t\t\t\t\t\t\t${orange}$id${reset}"
echo -e "${white}---> \$mp4\t\t\t\t\t\t\t\t\t\t\t${orange}$mp4${reset}"
echo -e "${white}---> \$simple_name_file\t\t\t\t\t\t\t\t\t\t${orange}$simple_name_file${reset}"
echo -e "${white}---> \$file_no_ext_imdb\t\t\t\t\t\t\t\t\t\t${orange}$file_no_ext_imdb${reset}"
echo -e "${white}---> \$temp\t\t\t\t\t\t\t\t\t\t\t${orange}$temp${reset}"
echo -e "${white}---> \$simple_name_file\t\t\t\t\t\t\t\t\t\t${orange}$simple_name_file${reset}"

name_no_space=$(
echo $title | tr -s ' ' | tr ' ' '_'
)

echo -e "${white}---> \$name_no_space\t\t\t\t\t\t\t\t\t\t${orange}$name_no_space${reset}"

##
## Export dans des variables dans $dir/tmp_bash
##
echo -e "${white}---> Export dans des variables dans : \t\t\t\t\t\t\t\t${orange}$dir/tmp_bash"
# Definitions
printf 'orange=`tput setaf 11`
purple=`tput setaf 13`
Line=`tput smul`
bold=`tput bold`
bg_orange=`tput setab 178`
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
' > "$dir"/tmp_bash

echo -e "${white}---> 🗜"\ "Checking archives zip\t\t\t\t\t\t\t\t\t${orange}"$temp"/ZIPS/HTML_*.zip
"

echo "${bg_green}${white}
####################################################################################################################
--> Telechargement conditionel des HTML
####################################################################################################################${reset}"

count=`ls -1 "$temp"/ZIPS/*.zip 2>/dev/null | wc -l`
if [ $count != 0 ]
then
NewestZip=$(ls -t $temp/ZIPS/HTML*.zip | head -n1)
LastDate=$( echo $NewestZip | awk -F'ZIPS/HTML' '{print $2}' | awk '!/No\ such\ file\ or\ directory/' )
LastDateRead=$(echo $LastDate | awk -F'\_' '{print $2, $3,$4,$5}' | tr -d ' '  )
DateduFichier=$(date -j -f "%Y%m%d%Hh%Mm%Ss" "$(echo $LastDateRead)" | sed -e 's/ CEST//g' )
echo -e "${white}---> L'archive .zip du ${orange}"$DateduFichier" ${white}est présente dans :\t\t\t\t${orange}$temp/ZIPS/"
echo -e "${white}---> Restauration à partir du dernier backup :\t\t\t\t\t\t\t${orange}$LastDate"
unzip -j -o -qq $NewestZip -d "$file_no_ext_imdb"_Fields/HTML/ &> /dev/null
echo -e "${white}---> Les fichiers suivant ont été dézipés dans :\t\t\t\t\t\t\t${orange}$temp/HTML/${green}"
ls "$file_no_ext_imdb"_Fields/HTML/

else
echo "${bg_orange}${white}
####################################################################################################################
---> File not found downloading with wget
####################################################################################################################${reset}
"
echo -e "${white}---> Rapatriement du fullcredit imdb dans\t\t\t\t\t${orange}$temp\HTML${green}"
wget -O $temp/HTML/$id".html" https://www.imdb.com/title/$id/fullcredits
echo -e "${white}---> Rapatriement de la galerie imdb dans${orange}\t\t\t\t\t$temp\HTML${green}"
wget -O $temp/HTML/$id"_Gallery.html" https://www.imdb.com/title/$id/mediaviewer
echo -e "${white}---> Rapatriement de la page principale imdb dans${orange}\t\t\t\t$temp\HTML${green}"
wget -O $temp/HTML/$id"_main.html" https://www.imdb.com/title/$id/
echo -e "${white}---> Rapatriement des taglines imdb dans${orange}\t\t\t\t\t$temp\HTML${green}"
wget -O $temp/HTML/$id"_taglines.html" https://www.imdb.com/title/$id/taglines
echo -e "${white}---> Rapatriement des plotsummary imdb dans${orange}\t\t\t\t\t$temp\HTML${green}"
wget -O $temp/HTML/$id"_plotsummary.html" https://www.imdb.com/title/$id/plotsummary
echo -e "${white}---> Rapatriement des releaseinfo imdb dans${orange}\t\t\t\t\t$temp\HTML${green}"
wget -O $temp/HTML/$id"_releaseinfo.html" https://www.imdb.com/title/$id/releaseinfo
echo -e "${white}---> Rapatriement des locations imdb dans${orange}\t\t\t\t\t$temp\HTML${green}"
wget -O $temp/HTML/$id"_locations.html" https://www.imdb.com/title/$id/locations
echo -e "${white}---> Rapatriement des goofs imdb dans${orange}\t\t\t\t\t\t$temp\HTML${green}"
wget -O $temp/HTML/$id"_goofs.html" https://www.imdb.com/title/$id/goofs
echo -e "${white}---> Rapatriement des trivia imdb dans${orange}\t\t\t\t\t\t$temp\HTML${green}"
wget -O $temp/HTML/$id"_trivia.html" https://www.imdb.com/title/$id/trivia
#ls "$temp"/ZIPS/
fi
#
## Fin du zip check archives
#

echo -e "${white}---> Procssing HTML segments with\t\t\t\t\t\t\t\t${green}awk${reset}"
echo -e "${white}---> \$title\t\t\t\t\t\t\t\t\t\t\t${orange}$title${reset}"
echo -e "${white}---> \$year\t\t\t\t\t\t\t\t\t\t\t${orange}$year${reset}"
echo -e "${white}---> \$id\t\t\t\t\t\t\t\t\t\t\t${orange}$id${reset}"
echo -e "${white}---> \$mp4\t\t\t\t\t\t\t\t\t\t\t${orange}$mp4${reset}"
echo -e "${white}---> \$simple_name_file\t\t\t\t\t\t\t\t\t\t${orange}$simple_name_file${reset}"
echo -e "${white}---> \$file_no_ext_imdb\t\t\t\t\t\t\t\t\t\t${orange}$file_no_ext_imdb${reset}"
echo -e "${white}---> \$temp \t\t\t\t\t\t\t\t\t\t\t${orange}$temp${reset}"
echo -e "${white}---> \$simple_name_file \t\t\t\t\t\t\t\t\t\t${orange}$simple_name_file${reset}"

name_no_space=$(
echo $title | tr -s ' ' | tr ' ' '_'
)

##
#
## Export dans des variables dans $dir/tmp_bash
##

# title fr
echo -e "${white}---> processing\t\t\t\t\t\t\t\t\t\t\t${green}\$titlefr"
awk '/<title>/,/<\/title>/' "$temp"/HTML/"$id".html > "$temp"/HTML/"$id"_title_fr.html
awk '/<title>/,/<\/title>/' "$temp"/HTML/"$id"_title_fr.html > "$temp"/HTML/"$id"_title_fr.txt
awk '{gsub("<title>", "");print}' "$temp"/HTML/"$id"_title_fr.txt | awk '{gsub("<\/title>", "");print}' | awk '{gsub(" - Full Cast &amp; Crew - IMDb", "");print}' | awk '{print} NR==1{exit}' | sed -e 's/^ *//g' -e 's/ *$//g' | sed 's/.\{7\}$//' | awk '{gsub(/\ \(TV\ Movi/,"",$0)}1' | awk '{gsub(/\ \(Vide/,"",$0)}1' | awk '{gsub(/\ \(TV\ Episod/,"",$0)}1'  | awk '{gsub(/\ \(TV\ Mini-Serie/,"",$0)}1' | awk '{gsub(/\ \(TV\ Shor/,"",$0)}1' > "$temp"/HTML/"$id"_title_fr_01.txt
sed '1i\
titlefr
' "$temp"/HTML/"$id"_title_fr_01.txt > "$temp"/CSV_FIELDS/"$id"_titlefr.csv
titlefr=$(cat "$temp"/HTML/"$id"_title_fr_01.txt)

echo -e "${white}---> \$titlefr\t\t\t\t\t\t\t\t\t\t\t${orange}$titlefr"
echo "titlefr=\"$titlefr\"" >> "$dir"/tmp_bash


echo "temp="$temp"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' | sed -e 's/\/\//\//g' >> "$dir"/tmp_bash
echo "name_no_space="$name_no_space"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
echo "year="$year"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
echo "title="$title"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
echo "mp4="$mp4"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
echo "imdbID="$id"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
echo "id="$id"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
echo "file_no_ext_imdb="$file_no_ext_imdb"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
echo "imdb_infomation="$imdb_infomation"" | sed -e 's/\/\//\//g' | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
# Series
if grep -q 'data-testid="hero-subnav-bar-previous-episode-button"' $temp/HTML/$id"_main.html"; then
echo "${orange}
####################################################################################################################
---> 📺"\ " Je suis une série
####################################################################################################################${reset}"
echo "SERIE=1" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
SERIE=1
./Episodes.sh
else
echo "${bg_green}${white}
####################################################################################################################
---> Je ne suis pas une Serie
####################################################################################################################${reset}"
echo "SERIE=0" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
fi
cat tmp_bash | awk '!NF || !seen[$0]++' > tmp_bash1
mv tmp_bash1 tmp_bash
source $dir/tmp_bash
echo -e "${white}---> Directed by\t\t\t\t\t\t\t\t\t\t${orange}"$temp"/CSV_FIELDS/$id"_Directors.csv""
# Director
awk '/class\=\"dataHeaderWithBorder\">Directed by&nbsp\;<\/h4>/,/<\/table>/' "$temp"/HTML/"$id".html > "$temp"/HTML/"$id"_Directors.html
python2.7 _html2csv.py "$temp"/HTML/"$id"_Directors.html &> /dev/null
echo "${white}--->                                          ${green}Text cleaning                                     ${white}<---${reset}"
awk -F',' '{print $1}' $temp/HTML/$id"_Directors.csv" > $temp/HTML/$id"_Directors_00.txt"
awk '{gsub(/\" /,"",$0)}1' $temp/HTML/$id"_Directors_00.txt" |awk '{gsub(/\ "/,"",$0)}1' | awk '{gsub(/\"\"/,"",$0)}1' | awk 'NF > 0' > $temp/HTML/$id"_Directors_01.txt"
tr '\n' @ < $temp/HTML/$id"_Directors_01.txt" > $temp/HTML/$id"_Directors_02.txt"
sed 's/.$//' < "$temp"/HTML/$id"_Directors_02.txt" > $temp/CSV_FIELDS/$id"_Directors.csv"
printf '%s\n' 0a 'director1' . x | ex $temp/CSV_FIELDS/$id"_Directors.csv"

# Genre
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Genre"
cat $temp/HTML/$id"_main.html" |tr -d '\n'  |sed 's/class\=\"GenresAndPlot/\
A/g' |awk '/A__GenreChip/'| awk -F'presentation">' '{print $2}' | awk -F'<' '{print $1}' | tr '\n' @|sed 's/.$//' > $temp/CSV_FIELDS/$id"_Genre.csv"
printf '%s\n' 0a 'genre1' . x | ex $temp/CSV_FIELDS/$id"_Genre.csv"

# machine_name, url, id
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}machine_name, url, id"
# machine name
machine_name=$(
echo $name_no_space | tr "[:upper:]" "[:lower:]"
)
echo "$machine_name"_"$year" > $temp/CSV_FIELDS/$id"_machine_name.csv"
printf '%s\n' 0a 'machine_name' . x | ex $temp/CSV_FIELDS/$id"_machine_name.csv"
# url
echo "/"title/$id > $temp/CSV_FIELDS/$id"_url.csv"
printf '%s\n' 0a 'url' . x | ex $temp/CSV_FIELDS/$id"_url.csv"
# id
echo "$id" > $temp/CSV_FIELDS/$id"_id.csv"
printf '%s\n' 0a 'imdb_id' . x | ex $temp/CSV_FIELDS/$id"_id.csv"
awk '/<h1 class\=\"header\">Taglines<\/h1>/,/<div class\=\"article\" id\=\"see_also\">/' $temp/HTML/$id"_Taglines.html" | awk '!/<h1/' | awk '!/<div/' | awk '!/<\/div>/' | awk 'NF > 0' |awk 'sub(/^ */, "")' > $temp/HTML/$id"_Taglines_01.txt"
tr '\n' @ < $temp/HTML/$id"_Taglines_01.txt" > $temp/HTML/$id"_Taglines_02.txt"
sed 's/.$//' < $temp/HTML/$id"_Taglines_02.txt" > $temp/CSV_FIELDS/$id"_Taglines.csv"
printf '%s\n' 0a 'tagline' . x | ex $temp/CSV_FIELDS/$id"_Taglines.csv"

if grep -q 'Be the first to contribute' $temp/CSV_FIELDS/$id"_Taglines.csv"
then
echo  "${white}---> Cleaning the csv file to only the header"
printf "tagline
" > $temp/CSV_FIELDS/$id"_Taglines.csv"
else
echo -e "${white}---> "$id"_Taglines.csv\t\t\t\t\t\t\t\t\t${green}Contains information"
fi

# Director of photography
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Director of photgraphy D.O.P"


awk '/id="cinematographer"/,/<\/table>/' $temp/HTML/$id".html" > $temp/HTML/$id"_DOP.html"
python2.7 _html2csv.py $temp/HTML/$id"_DOP.html" &> /dev/null
awk -F',' '{print $1}' $temp/HTML/$id"_DOP.csv" |awk '{gsub(/\" /,"",$0)}1'|awk '{gsub(/\ "/,"",$0)}1' | awk '{gsub(/\"\"/,"",$0)}1' > $temp/HTML/$id"_DOP_01.txt"
tr '\n' @ < $temp/HTML/$id"_DOP_01.txt" > $temp/HTML/$id"_DOP_02.txt"
sed 's/.$//' < $temp/HTML/$id"_DOP_02.txt" > $temp/CSV_FIELDS/$id"_DOP.csv"
printf '%s\n' 0a 'dop' . x | ex $temp/CSV_FIELDS/$id"_DOP.csv"
cp $temp/HTML/$id"_DOP_02.txt" ../
cp $temp/CSV_FIELDS/$id"_DOP.csv" ../
# Film Editor
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\tFilm editor"
awk '/class\=\"dataHeaderWithBorder\">Film Editing by&nbsp\;<\/h4>/,/<\/table>/' $temp/HTML/$id".html" > $temp/HTML/$id"_Editors.html"
python2.7 _html2csv.py $temp/HTML/$id"_Editors.html" &> /dev/null
awk -F',' '{print $1}' $temp/HTML/$id"_Editors.csv" > $temp/HTML/$id"_Editors_00.txt"
awk '{gsub(/\" /,"",$0)}1' $temp/HTML/$id"_Editors_00.txt" |awk '{gsub(/\ "/,"",$0)}1' | awk '{gsub(/\"\"/,"",$0)}1' | awk 'NF > 0' > $temp/HTML/$id"_Editors_01.txt"
tr '\n' @ < $temp/HTML/$id"_Editors_01.txt" > $temp/HTML/$id"_Editors_02.txt"
sed 's/.$//' < $temp/HTML/$id"_Editors_02.txt" > $temp/CSV_FIELDS/$id"_Editors.csv"
printf '%s\n' 0a 'editors' . x | ex $temp/CSV_FIELDS/$id"_Editors.csv"

# Film writers
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Film writers"
awk '/dataHeaderWithBorder\">Writing Credits/,/<\/table>/' $temp/HTML/$id".html" > $temp/HTML/$id"_Writing_Credits.html"
python2.7 _html2csv.py $temp/HTML/$id"_Writing_Credits.html" &> /dev/null
awk -F',' '{print $1}' $temp/HTML/$id"_Writing_Credits.csv" > $temp/HTML/$id"_Writing_Credits_00.txt"
awk '{gsub(/\" /,"",$0)}1' $temp/HTML/$id"_Writing_Credits_00.txt" |awk '{gsub(/\ "/,"",$0)}1' | awk '{gsub(/\"\"/,"",$0)}1' | awk 'NF > 0' > $temp/HTML/$id"_Writing_Credits_01.txt"
tr '\n' @ < $temp/HTML/$id"_Writing_Credits_01.txt" > $temp/HTML/$id"_Writing_Credits_02.txt"
sed 's/.$//' < $temp/HTML/$id"_Writing_Credits_02.txt" > $temp/CSV_FIELDS/$id"_Writing_Credits.csv"
printf '%s\n' 0a 'writers' . x | ex $temp/CSV_FIELDS/$id"_Writing_Credits.csv"

# Framerate
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Framerate, File Size, Image Size, Duration"
exiftool $file_no_ext_imdb".mp4" > $temp/HTML/vinfo_tmp_00.txt
awk '/^Video Frame Rate                : /' $temp/HTML/vinfo_tmp_00.txt > $temp/HTML/framerate_tmp_01.txt
fps=$(cat $temp/HTML/framerate_tmp_01.txt | sed -n 's/[^:]*\:\ //p')
printf "framerate
$fps Fp/s
" > $temp/CSV_FIELDS/$id"_framerate.csv"

# Filesize
awk '/^File Size                       : /' $temp/HTML/vinfo_tmp_00.txt | sed -n 's/[^:]*\:\ //p' > $temp/HTML/filesize_tmp_01.txt
filesize=$(cat $temp/HTML/filesize_tmp_01.txt)
printf "filesize
$filesize
" > $temp/CSV_FIELDS/$id"_filesize.csv"

# Image Size
awk '/^Image Size                      : /' $temp/HTML/vinfo_tmp_00.txt | sed -n 's/[^:]*\:\ //p'> $temp/HTML/vsize_tmp_01.txt
vsize=$(cat $temp/HTML/vsize_tmp_01.txt)
printf "vsize
$vsize PX
" > $temp/CSV_FIELDS/$id"_vsize.csv"
# V duration
awk '/^Media Duration                  : /' $temp/HTML/vinfo_tmp_00.txt | sed -n 's/[^:]*\:\ //p' > $temp/HTML/duration_tmp_01.txt
duration=$(cat $temp/HTML/duration_tmp_01.txt)
printf "durvid
$duration
" > $temp/CSV_FIELDS/$id"_duration.csv"

# aspectratio
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Aspect/Ratio"
cat $temp/HTML/$id"_main.html" | tr -d '\n' | awk -F'ipc-metadata-list-item__label">Aspect ratio<' '{print $2}' | awk -F'<ul' '{print $2}'| awk -F'</ul>' '{print $1}'| sed 's/<li/\
<li/g' | awk -F'>' '{print $3}'| awk -F'<' '{print $1}'| awk NF|tr '\n' '@'| sed 's/.$//' > $temp/CSV_FIELDS/$id"_aspectratio.csv"
printf '%s\n' 0a 'aspectratio' . x | ex $temp/CSV_FIELDS/$id"_aspectratio.csv"

# sound system
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Sound System"
cat $temp/HTML/$id"_main.html" | tr -d '\n' | awk -F'ipc-metadata-list-item__label">Sound mix<' '{print $2}' | awk -F'<ul' '{print $2}'| awk -F'</ul>' '{print $1}'| sed 's/<li/\
<li/g' | awk -F'>' '{print $3}'| awk -F'<' '{print $1}'| awk NF|tr '\n' '@'| sed 's/.$//' > $temp/CSV_FIELDS/$id"_sound_system.csv"
printf '%s\n' 0a 'soundmix1' . x | ex $temp/CSV_FIELDS/$id"_sound_system.csv"

# color
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Color"
cat $temp/HTML/$id"_main.html" | tr -d '\n' | awk -F'ipc-metadata-list-item__label">Color<' '{print $2}' | awk -F'<ul' '{print $2}'| awk -F'</ul>' '{print $1}'| sed 's/<li/\
<li/g' | awk -F'>' '{print $3}'| awk -F'<' '{print $1}'| awk NF|tr '\n' '@'| sed 's/.$//' > $temp/CSV_FIELDS/$id"_color.csv"
printf '%s\n' 0a 'color' . x | ex $temp/CSV_FIELDS/$id"_color.csv"

# Country
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Country"
cat $temp/HTML/$id"_main.html" | tr -d '\n' | awk -F' of origin<' '{print $2}'|awk -F'</ul>' '{print $1}' | awk -F'<ul' '{print $2}'| awk -F'presentation">' '{print $2}'|awk -F'</ul>' '{print $1}' | sed 's/<li/\
<li/g' | awk NF | awk -F'tt_dt_cn">' '{print $2}' | awk -F'<' '{print $1}'|tr '\n' @ |sed 's/.$//' > $temp/CSV_FIELDS/$id"_country.csv"
printf '%s\n' 0a 'country' . x | ex $temp/CSV_FIELDS/$id"_country.csv"


# runtime
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Runtime"
cat $temp/HTML/$id"_main.html" | tr -d '\n' | awk -F'>Runtime' '{print $2}' | awk -F'ipc-metadata-list-item__list-content-item' '{print $2}' | awk -F'>' '{print $2}'| awk -F'<' '{print $1}'  > $temp/CSV_FIELDS/$id"_runtime.csv"
printf '%s\n' 0a 'runtime' . x | ex $temp/CSV_FIELDS/$id"_runtime.csv"

# Budget
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Budget"
amount=$(awk '/<h4 class\=\"inline\">Budget:<\/h4>/,/<\/div>/' $temp/HTML/$id"_main.html" | awk -F'<\/h4>' '{print $2}')
amount_option=$(awk '/<h4 class\=\"inline\">Budget:<\/h4>/,/<\/div>/' $temp/HTML/$id"_main.html" | awk -F'\"attribute\">' '{print $2}')
budget=$(echo $amount $amount_option)
echo "$budget" > $temp/HTML/$id"_budget.txt"
awk 'sub(/<\/span>/, "")' $temp/HTML/$id"_budget.txt" > $temp/CSV_FIELDS/$id"_budget.csv"
printf '%s\n' 0a 'budget' . x | ex $temp/CSV_FIELDS/$id"_budget.csv"
# Creating opening tags for main Menu
printf '' >$temp/HTML/$id"_Button_Main_temp.html"

# Plot
# Summary

awk '/<h1 class\=\"header\">Plot<\/h1>/,/<h4\ id\=\"synopsis\"/' $temp/HTML/$id"_plotsummary.html" | awk '!/\/search\/title\?plot_author/' | awk '/<div\ class\=\"author-container\">/{matched=1;next} 1==matched{matched=0;next} {print}' | awk '/<h4\ id\=\"summaries\"/,/<\/ul>/' | awk '{gsub(/<li\ class\=\"ipl-zebra-list__item\".*>/,"<li\ class\=\"list-group-item\">",$0)}1' | awk '{gsub(/<ul\ class\=\"ipl-zebra-list\"\ id\=\"plot-summaries-content\">/,"<ul\ class\=\"list-group\">",$0)}1' | awk '!/<h1\ class\=\"header/' | awk '!/<h4/' > $temp/HTML/$id"_Plot.txt"


#Synopsis
awk '/<h4\ id\=\"synopsis\"\ class\=\"ipl-list-title\">Synopsis<\/h4>/,/<\/section>/' $temp/HTML/$id"_plotsummary.html" > $temp/HTML/$id"_Synopsis_temp.txt"
tr '\n' ' ' < $temp/HTML/$id"_Synopsis_temp.txt" > $temp/HTML/$id"_Synopsis_temp_01.txt"
sed 's/>/>\
/g' $temp/HTML/$id"_Synopsis_temp_01.txt" > $temp/HTML/$id"_Synopsis_temp_02.txt"
awk '{gsub(/<li\ class\=\"ipl-zebra-list__item\".*>/,"<li\ class\=\"list-group-item\">",$0)}1' $temp/HTML/$id"_Synopsis_temp_02.txt" | awk '{gsub(/<ul\ class\=\"ipl-zebra-list.*>/,"<ul\ class\=\"list-group\">",$0)}1' | awk '!/<\/section>/' | awk '!/<h4/' | awk '!/<\/h4>/' > $temp/HTML/$id"_Synopsis.txt"
if grep -q 'Be the first to contribute' $temp/HTML/$id"_Synopsis.txt"
then
echo  "${white}---> Cleaning the file to blank"
printf '' > $temp/HTML/$id"_Synopsis.txt"
printf '<h1 id="plot">Plot</h1><div aria-label="Basic main" class="btn-group" role="group"><a class="btn btn-secondary" href="#the_film" type="button">Back to the film<span class="glyphicon glyphicon-arrow-up"></span></a></div><h3>Summary</h3>' > $temp/HTML/$id"_plot_synopsis.txt"
cat $temp/HTML/$id"_Plot.txt" >> $temp/HTML/$id"_plot_synopsis.txt"
printf '<a class="btn btn-secondary" href="#plot" type="button">Plot</a>' > $temp/HTML/$id"_Button_Main_button.txt"
else
echo -e "${white}---> Synopsis...\t\t\t\t\t\t\t\t\t\t${green}Contains information"
printf '<h1 id="plot">Plot</h1><div aria-label="Basic main" class="btn-group" role="group"><a class="btn btn-secondary" href="#synopsis" type="button">Synopsis</a><a class="btn btn-secondary" href="#the_film" type="button">Back to the film<span class="glyphicon glyphicon-arrow-up"></span></a></div><h3>Summary</h3>' > $temp/HTML/$id"_plot_synopsis.txt"
cat $temp/HTML/$id"_Plot.txt" >> $temp/HTML/$id"_plot_synopsis.txt"
printf '<h3 class="text-danger" id="synopsis">Spoilers</h3><div class="p-3 mb-2 bg-danger text-white">The synopsis below may give away important plot points.</div>' >> $temp/HTML/$id"_plot_synopsis.txt"
printf '<h3 class="ipl-list-title">Synopsis</h3>' >> $temp/HTML/$id"_plot_synopsis.txt"
cat $temp/HTML/$id"_Synopsis.txt" >> $temp/HTML/$id"_plot_synopsis.txt"
printf '<a class="btn btn-secondary" href="#plot" type="button">Plot</a><a class="btn btn-secondary" href="#synopsis" type="button">Synopsis</a>' > $temp/HTML/$id"_Button_Main_button.txt"
fi
tr '\n' '\ ' < $temp/HTML/$id"_plot_synopsis.txt" > $temp/CSV_FIELDS/$id"_plot_synopsis.csv"
printf '%s\n' 0a 'plot' . x | ex $temp/CSV_FIELDS/$id"_plot_synopsis.csv"

# Trivia
if grep -q '<div class="jumpto">' $temp/HTML/$id"_trivia.html" ;
then
# links, ids & items list
echo -e "${white}---> The div class=\"Jumpto\"\t\t\t\t\t\t\t\t\t${green}Is present"
awk '/<h1 class\=\"header\">Trivia<\/h1>/,/<h2>See also<\/h2>/' $temp/HTML/$id"_trivia.html" > $temp/HTML/$id"_Trivia_00.txt"

awk '/<div\ id\=\"trivia_content\" class\=\"header\">/,/<div\ class\=\"list\">/' $temp/HTML/$id"_Trivia_00.txt" > $temp/HTML/$id"_Trivia_tmp00.txt"
#Generate trivia button
awk -F"<a href\=" '{print $2}' $temp/HTML/$id"_Trivia_tmp00.txt" | awk 'NF > 0' | awk -F"\)"  '{print $1}' | awk -F'<\/a>\&nbsp;\\(' '{print $1, $2}' OFS='<span class\=\"badge nbnw\">' | awk '{print "<a\ class\=\"btn btn-secondary\"\ type\=\"button\"\ href\="$0"<\/span><\/a>"}' > $temp/HTML/$id"_Trivia_button.txt"
#Genrate command regardless categories from $temp/HTML/$id"_Trivia_button.txt"
awk -F'\"' '{print $6}' $temp/HTML/$id"_Trivia_button.txt" | Tr -d '#' | awk 'NF > 0' | awk '{print "<a\ id\=\""$0"\""}' > $temp/HTML/$id"_Trivia_ID_list.txt"

i=0
mkdir -p $temp/HTML/Trivia_lines/_output
cat $temp/HTML/$id"_Trivia_ID_list.txt" | while read line
do
let i++;
echo "$line" | awk -F'\"' '{print $2}' > $temp/HTML/Trivia_lines/ID_"$i".txt
done


#segmentation des paragraphes
Trivia1=$temp/HTML/Trivia_lines/ID_1.txt
Trivia2=$temp/HTML/Trivia_lines/ID_2.txt
Trivia3=$temp/HTML/Trivia_lines/ID_3.txt
Trivia4=$temp/HTML/Trivia_lines/ID_4.txt
Trivia5=$temp/HTML/Trivia_lines/ID_5.txt
Trivia6=$temp/HTML/Trivia_lines/ID_6.txt
Trivia7=$temp/HTML/Trivia_lines/ID_7.txt
Trivia8=$temp/HTML/Trivia_lines/ID_8.txt
Trivia9=$temp/HTML/Trivia_lines/ID_9.txt
Trivia10=$temp/HTML/Trivia_lines/ID_10.txt
Trivia11=$temp/HTML/Trivia_lines/ID_11.txt
Trivia12=$temp/HTML/Trivia_lines/ID_12.txt

if [[ -f "$Trivia1" ]]; then
a=$(cat $Trivia1)
else
a=$(echo "see_also")
fi
awk '/id\=\"trivia_content/,/id\=\"'$a'/' $temp/HTML/$id"_Trivia_00.txt" > $temp/HTML/Trivia_lines/_output/1trivia_TRIVIA.txt

if [[ -f "$Trivia2" ]]; then
b=$(cat $Trivia2)
else
b=$(echo "see_also")
fi
awk '/id\=\"'$a'/,/id\=\"'$b'/' $temp/HTML/$id"_Trivia_00.txt" > $temp/HTML/Trivia_lines/_output/2"$a"_TRIVIA.txt

if [[ -f "$Trivia3" ]]; then
c=$(cat $Trivia3)
else
c=$(echo "see_also")
fi
awk '/id\=\"'$b'/,/id\=\"'$c'/' $temp/HTML/$id"_Trivia_00.txt" > $temp/HTML/Trivia_lines/_output/2"$b"_TRIVIA.txt

if [[ -f "$Trivia4" ]]; then
d=$(cat $Trivia4)
else
d=$(echo "see_also")
fi
awk '/id\=\"'$c'/,/id\=\"'$d'/' $temp/HTML/$id"_Trivia_00.txt" > $temp/HTML/Trivia_lines/_output/3"$c"_TRIVIA.txt

if [[ -f "$Trivia5" ]]; then
e=$(cat $Trivia5)
else
e=$(echo "see_also")
fi
awk '/id\=\"'$d'/,/id\=\"'$e'/' $temp/HTML/$id"_Trivia_00.txt" > $temp/HTML/Trivia_lines/_output/4"$d"_TRIVIA.txt

if [[ -f "$Trivia6" ]]; then
f=$(cat $Trivia6)
else
f=$(echo "see_also")
fi
awk '/id\=\"'$e'/,/id\=\"'$f'/' $temp/HTML/$id"_Trivia_00.txt" > $temp/HTML/Trivia_lines/_output/5"$e"_TRIVIA.txt

if [[ -f "$Trivia7" ]]; then
g=$(cat $Trivia7)
else
g=$(echo "see_also")
fi
awk '/id\=\"'$f'/,/id\=\"'$g'/' $temp/HTML/$id"_Trivia_00.txt" > $temp/HTML/Trivia_lines/_output/6"$f"_TRIVIA.txt

if [[ -f "$Trivia8" ]]; then
g=$(cat $Trivia8)
else
g=$(echo "see_also")
fi
awk '/id\=\"'$g'/,/id\=\"'$h'/' $temp/HTML/$id"_Trivia_00.txt" > $temp/HTML/Trivia_lines/_output/7"$g"_TRIVIA.txt

if [[ -f "$Trivia9" ]]; then
h=$(cat $Trivia9)
else
h=$(echo "see_also")
fi
awk '/id\=\"'$h'/,/id\=\"'$i'/' $temp/HTML/$id"_Trivia_00.txt" > $temp/HTML/Trivia_lines/_output/8"$h"_TRIVIA.txt
if [[ -f "$Trivia10" ]]; then
i=$(cat $Trivia10)
else
i=$(echo "see_also")
fi
awk '/id\=\"'$i'/,/id\=\"'$j'/' $temp/HTML/$id"_Trivia_00.txt" > $temp/HTML/Trivia_lines/_output/9"$i"_TRIVIA.txt

if [[ -f "$Trivia11" ]]; then
j=$(cat $Trivia11)
else
j=$(echo "see_also")
fi
awk '/id\=\"'$j'/,/id\=\"'$k'/' $temp/HTML/$id"_Trivia_00.txt" > $temp/HTML/Trivia_lines/_output/10"$j"_TRIVIA.txt

if [[ -f "$Trivia12" ]]; then
k=$(cat $Trivia12)
else
k=$(echo "see_also")
fi
awk '/id\=\"'$k'/,/id\=\"'$l'/' $temp/HTML/$id"_Trivia_00.txt" > $temp/HTML/Trivia_lines/_output/11"$k"_TRIVIA.txt
if [[ -f "$Trivia13" ]]; then
l=$(echo "see_also")
else
l=$(echo "see_also")
fi
awk '/id\=\"'$l'/,/id\=\"'$m'/' $temp/HTML/$id"_Trivia_00.txt" > $temp/HTML/Trivia_lines/_output/12"$l"_TRIVIA.txt

printf '<a id="trivia"
' >> $temp/HTML/$id"_Trivia_ID_list.txt"
cat $temp/HTML/$id"_Trivia_ID_list.txt" | while read id_line
do
category=$(echo $id_line | awk -F'\"' '{print $2}')
awk '/<div\ class\=\"sodatext\">/{p=1; s=$0}
p && /<\/div>/{print $0 FS s; s=""; p=0}
p' $temp/HTML/Trivia_lines/_output/*$category* | sed -e 's/<\/div>\ \ \ \<div\ class\=\"sodatext\">/<\/li>/g' | sed -e 's/<div\ class\=\"sodatext\">/<li\ class\=\"list-group-item\">/g' > $temp/HTML/Trivia_lines/_output/"$category".txt
done

if_spoiler=$temp/HTML/Trivia_lines/_output/spoilers.txt
if [[ -f "$if_spoiler" ]]; then
printf '<div class="p-3 mb-2 bg-danger text-white">The trivia below may give away important plot points.</div>' > $temp/HTML/Trivia_lines/_output/spoilers_tmp.txt
cat $temp/HTML/Trivia_lines/_output/spoilers.txt >> $temp/HTML/Trivia_lines/_output/spoilers_tmp.txt
mv $temp/HTML/Trivia_lines/_output/spoilers_tmp.txt $temp/HTML/Trivia_lines/_output/spoilers.txt
fi
if_trivia=$temp/HTML/Trivia_lines/_output/trivia.txt
if [[ -f "$if_trivia" ]]; then
awk -F'\#' '{print "<h3\ id\=\""$2}' $temp/HTML/$id"_Trivia_button.txt" | awk -F'<span' '{print $1"<\/h3>"}' > $temp/HTML/$id"_Trivia_h3titles.txt"
printf '<h1 id="trivia">Trivia</h1><div aria-label="Basic main" class="btn-group" role="group">' > $temp/HTML/$id"_Trivia_def.txt"
cat $temp/HTML/$id"_Trivia_button.txt" >> $temp/HTML/$id"_Trivia_def.txt"

printf '<a class="btn btn-secondary" href="#the_film" type="button">Back to the film<span class="glyphicon glyphicon-arrow-up"></span></a></div>' >> $temp/HTML/$id"_Trivia_def.txt"
cat $temp/HTML/Trivia_lines/_output/trivia.txt >> $temp/HTML/$id"_Trivia_def.txt"
fi

cat $temp/HTML/$id"_Trivia_h3titles.txt" | while read id_line
do
printf '<ul class="list-group">' >> $temp/HTML/$id"_Trivia_def.txt"
h3=$(echo $id_line | awk -F'\"' '{print $2}')
echo $id_line >> $temp/HTML/$id"_Trivia_def.txt"
cat $temp/HTML/Trivia_lines/_output/"$h3".txt >> $temp/HTML/$id"_Trivia_def.txt"
printf '</ul>' >> $temp/HTML/$id"_Trivia_def.txt"
done

tr '\n' ' ' < $temp/HTML/$id"_Trivia_def.txt" > $temp/CSV_FIELDS/$id"_trivia.csv"
printf '%s\n' 0a 'trivia' . x | ex $temp/CSV_FIELDS/$id"_trivia.csv"

else
echo -e "${white}---> The div class=\"Jumpto\"\t\t\t\t\t\t\t\t\t${red}Not Found"

mkdir -p $temp/HTML/Trivia_lines/_output
awk '/<h1 class\=\"header\">Trivia<\/h1>/,/<h2>See also<\/h2>/' $temp/HTML/$id"_trivia.html" > $temp/HTML/$id"_Trivia_00.txt"

awk '/<div\ class\=\"sodatext\">/{p=1; s=$0}
p && /<\/div>/{print $0 FS s; s=""; p=0}
p' $temp/HTML/$id"_Trivia_00.txt" | sed -e 's/<\/div>\ \ \ \<div\ class\=\"sodatext\">/<\/li>/g' | sed -e 's/<div\ class\=\"sodatext\">/<li\ class\=\"list-group-item\">/g' > $temp/HTML/Trivia_lines/_output/trivia.txt
printf '<h1 id="trivia">Trivia</h1>' > $temp/HTML/$id"_Trivia_def.txt"
printf '<a class="btn btn-secondary" href="#the_film" type="button">Back to the film<span class="glyphicon glyphicon-arrow-up"></span></a></div>' >> $temp/HTML/$id"_Trivia_def.txt"
printf '<ul class="list-group">' >> $temp/HTML/$id"_Trivia_def_no_jump.txt"
cat $temp/HTML/Trivia_lines/_output/trivia.txt >> $temp/HTML/$id"_Trivia_def.txt"
printf '</ul>' >> $temp/HTML/$id"_Trivia_def.txt"
tr '\n' ' ' < $temp/HTML/$id"_Trivia_def.txt" > $temp/CSV_FIELDS/$id"_triviatmp.csv"
printf '%s\n' 0a 'trivia' . x | ex $temp/CSV_FIELDS/$id"_triviatmp.csv"
fi

if [[ -f $temp/CSV_FIELDS/$id"_triviatmp.csv" ]]; then
mv $temp/CSV_FIELDS/$id"_triviatmp.csv" $temp/CSV_FIELDS/$id"_trivia.csv"
fi

# Goofs
if grep -q '<div class="jumpto">' $temp/HTML/$id"_goofs.html" ;
then
# links, ids & items list
awk '/<h1 class\=\"header\">Goofs<\/h1>/,/<h2>See also<\/h2>/' $temp/HTML/$id"_goofs.html" | sed 's/>/>\
/g' | sed -e 's/id\=\"spoilers\"/id\=\"spoilers_goofs\"/g' | sed -e 's/href\=\"#spoilers\"/href\=\"#spoilers_goofs\"/g' | sed -e 's/Spoilers<\/a>/Goofs\ spoilers<\/a>/g' > $temp/HTML/$id"_Goofs_00.txt"
awk '/<div\ id\=\"goofs_content\" class\=\"header\">/,/<div\ class\=\"list\">/' $temp/HTML/$id"_Goofs_00.txt" > $temp/HTML/$id"_Goofs_tmp00.txt"
#Generate goofs button
awk '/>$/ { printf("%s\t", $0); next } 1' $temp/HTML/$id"_Goofs_tmp00.txt" | awk -F"<a href\=" '{print $2}' | tr -d '\t' | sed -e 's/\ \ \ \ //g' | awk 'NF > 0' | awk -F"\)"  '{print $1}' | awk -F'<\/a>\&nbsp;\\(' '{print $1, $2}' OFS='<span class\=\"badge nbnw\">' | awk '{print "<a\ class\=\"btn btn-secondary\"\ type\=\"button\"\ href\="$0"<\/span><\/a>"}' > $temp/HTML/$id"_Goofs_button.txt"
#Genrate ids regardless categories from $temp/HTML/$id"_Goofs_button.txt"
awk -F'\"' '{print $6}' $temp/HTML/$id"_Goofs_button.txt" | Tr -d '#' | awk 'NF > 0' | awk '{print "<a\ id\=\""$0"\""}' > $temp/HTML/$id"_Goofs_ID_list.txt"

i=0
mkdir -p $temp/HTML/Goofs_lines/_output
cat $temp/HTML/$id"_Goofs_ID_list.txt" | while read line
do
let i++;
echo "$line" | awk -F'\"' '{print $2}' > $temp/HTML/Goofs_lines/ID_"$i".txt
done

if [ -f $temp/HTML/Goofs_lines/ID_1.txt ]; then

cp $temp/HTML/Goofs_lines/ID_1.txt $temp/HTML/Goofs_lines/BEGIN.txt
#segmentation des paragraphes
begin=$(cat $temp/HTML/Goofs_lines/BEGIN.txt)
FILE1=$temp/HTML/Goofs_lines/ID_1.txt
if [[ -f "$FILE1" ]]; then
a=$(cat $FILE1)
awk '/\#'$begin'/,/id\=\"'$a'/' $temp/HTML/$id"_Goofs_00.txt" > $temp/HTML/Goofs_lines/_output/1goofs_Goofs.txt
fi

FILE2=$temp/HTML/Goofs_lines/ID_2.txt
if [[ -f "$FILE2" ]]; then
b=$(cat $FILE2)
else
b='(echo "see_also")'
fi
awk '/id\=\"'$a'/,/id\=\"'$b'/' $temp/HTML/$id"_Goofs_00.txt" > $temp/HTML/Goofs_lines/_output/2"$a"_Goofs.txt

FILE3=$temp/HTML/Goofs_lines/ID_3.txt
if [[ -f "$FILE3" ]]; then
c=$(cat $FILE3)
else
c=$(echo "see_also")
fi
awk '/id\=\"'$b'/,/id\=\"'$c'/' $temp/HTML/$id"_Goofs_00.txt" > $temp/HTML/Goofs_lines/_output/3"$b"_Goofs.txt

FILE4=$temp/HTML/Goofs_lines/ID_4.txt
if [[ -f "$FILE4" ]]; then
d=$(cat $FILE4)
else
d=$(echo "see_also")
fi
awk '/id\=\"'$c'/,/id\=\"'$d'/' $temp/HTML/$id"_Goofs_00.txt" > $temp/HTML/Goofs_lines/_output/4"$c"_Goofs.txt

FILE5=$temp/HTML/Goofs_lines/ID_5.txt
if [[ -f "$FILE5" ]]; then
e=$(cat $FILE5)
else
e=$(echo "see_also")
fi
awk '/id\=\"'$d'/,/id\=\"'$e'/' $temp/HTML/$id"_Goofs_00.txt" > $temp/HTML/Goofs_lines/_output/5"$d"_Goofs.txt

FILE6=$temp/HTML/Goofs_lines/ID_6.txt
if [[ -f "$FILE6" ]]; then
f=$(cat $FILE6)
else
f=$(echo "see_also")
fi
awk '/id\=\"'$e'/,/id\=\"'$f'/' $temp/HTML/$id"_Goofs_00.txt" > $temp/HTML/Goofs_lines/_output/6"$e"_Goofs.txt

FILE7=$temp/HTML/Goofs_lines/ID_7.txt
if [[ -f "$FILE7" ]]; then
g=$(cat $FILE7)
else
g=$(echo "see_also")
fi
awk '/id\=\"'$f'/,/id\=\"'$g'/' $temp/HTML/$id"_Goofs_00.txt" > $temp/HTML/Goofs_lines/_output/7"$f"_Goofs.txt

FILE8=$temp/HTML/Goofs_lines/ID_8.txt
if [[ -f "$FILE8" ]];then
h=$(cat $FILE8)
else
h=$(echo "see_also")
fi
awk '/id\=\"'$g'/,/id\=\"'$h'/' $temp/HTML/$id"_Goofs_00.txt" > $temp/HTML/Goofs_lines/_output/8"$g"_Goofs.txt
FILE9=$temp/HTML/Goofs_lines/ID_9.txt
if [[ -f "$FILE9" ]]; then
i=$(cat $FILE9)
else
i=$(echo "see_also")
fi
awk '/id\=\"'$h'/,/id\=\"'$i'/' $temp/HTML/$id"_Goofs_00.txt" > $temp/HTML/Goofs_lines/_output/9"$h"_Goofs.txt

FILE10=$temp/HTML/Goofs_lines/ID_10.txt
if [[ -f "$FILE10" ]]; then
j=$(cat $FILE10)
else
j=$(echo "see_also")
fi
awk '/id\=\"'$i'/,/id\=\"'$j'/' $temp/HTML/$id"_Goofs_00.txt" > $temp/HTML/Goofs_lines/_output/10"$i"_Goofs.txt

FILE11=$temp/HTML/Goofs_lines/ID_11.txt
if [[ -f "$FILE11" ]]; then
k=$(cat $FILE11)
else
k=$(echo "see_also")
fi
awk '/id\=\"'$j'/,/id\=\"'$k'/' $temp/HTML/$id"_Goofs_00.txt" > $temp/HTML/Goofs_lines/_output/11"$j"_Goofs.txt

FILE12=$temp/HTML/Goofs_lines/ID_12.txt
if [[ -f "$FILE12" ]]; then
l=$(cat $FILE12)
else
l=$(echo "see_also")
fi
awk '/id\=\"'$k'/,/id\=\"'$l'/' $temp/HTML/$id"_Goofs_00.txt" > $temp/HTML/Goofs_lines/_output/12"$k"_Goofs.txt

FILE12=$temp/HTML/Goofs_lines/ID_12.txt
if [[ -f "$FILE12" ]]; then
l=$(cat $FILE12)
else
l=$(echo "see_also")
fi
awk '/id\=\"'$l'/,/id\=\"h2/' $temp/HTML/$id"_Goofs_00.txt" > $temp/HTML/Goofs_lines/_output/13"$l"_Goofs.txt

fi

printf '<a id="goofs"
' >> $temp/HTML/$id"_Goofs_ID_list.txt"
cat $temp/HTML/$id"_Goofs_ID_list.txt" | while read id_line
do
category=$(echo $id_line | awk -F'\"' '{print $2}')
awk '/<div\ class\=\"sodatext\">/{p=1; s=$0}
p && /<\/div>/{print $0 FS s; s=""; p=0}
p' $temp/HTML/Goofs_lines/_output/*$category* | sed -e 's/<\/div>\ \ \ \<div\ class\=\"sodatext\">/<\/li>/g' |sed -e 's/<div\ class\=\"sodatext\">/<li\ class\=\"list-group-item\">/g' | sed -e 's/<\/div>\ \ \ \ \ \ \ \ \ <li\ class\=\"list-group-item\">/<\/li>/g' | awk 'NF > 0' > $temp/HTML/Goofs_lines/_output/"$category".txt


done

if_spoilers_goofs=$temp/HTML/Goofs_lines/_output/spoilers_goofs.txt
if [[ -f "$if_spoilers_goofs" ]]; then
printf '<div class="p-3 mb-2 bg-danger text-white">The goofs items below may give away important plot points.</div>' > $temp/HTML/Goofs_lines/_output/spoilers_goofs_tmp.txt
cat $temp/HTML/Goofs_lines/_output/spoilers_goofs.txt >> $temp/HTML/Goofs_lines/_output/spoilers_goofs_tmp.txt
mv $temp/HTML/Goofs_lines/_output/spoilers_goofs_tmp.txt $temp/HTML/Goofs_lines/_output/spoilers_goofs.txt
fi

if_goofs=$temp/HTML/Goofs_lines/_output/goofs.txt
if [[ -f "$if_goofs" ]]; then
awk -F'\#' '{print "<h3\ id\=\""$2}' $temp/HTML/$id"_Goofs_button.txt" | awk -F'<span' '{print $1"<\/h3>"}' > $temp/HTML/$id"_Goofs_h3titles.txt"
printf '<h1 id="goofs">Goofs</h1><div aria-label="Basic main" class="btn-group" role="group">' > $temp/HTML/$id"_Goofs_def.txt"
cat $temp/HTML/$id"_Goofs_button.txt" >> $temp/HTML/$id"_Goofs_def.txt"
printf '<a class="btn btn-secondary" href="#the_film" type="button">Back to the film<span class="glyphicon glyphicon-arrow-up"></span></a></div>' >> $temp/HTML/$id"_Goofs_def.txt"
cat $temp/HTML/Goofs_lines/_output/goofs.txt >> $temp/HTML/$id"_Goofs_def.txt"
fi

cat $temp/HTML/$id"_Goofs_h3titles.txt" | while read id_line
do
printf '<ul class="list-group">' >> $temp/HTML/$id"_Goofs_def.txt"
h3=$(echo $id_line | awk -F'\"' '{print $2}')
echo $id_line >> $temp/HTML/$id"_Goofs_def.txt"
cat $temp/HTML/Goofs_lines/_output/"$h3".txt >> $temp/HTML/$id"_Goofs_def.txt"
printf '</ul>' >> $temp/HTML/$id"_Goofs_def.txt"
done

tr '\n' ' ' < $temp/HTML/$id"_Goofs_def.txt" > $temp/CSV_FIELDS/$id"_goofs.csv"
printf '%s\n' 0a 'goofs' . x | ex $temp/CSV_FIELDS/$id"_goofs.csv"

else
echo "---> DIV NO Jumpto, Simple Goofs"

mkdir -p $temp/HTML/Goofs_lines/_output
awk '/<h1 class\=\"header\">Goofs<\/h1>/,/<h2>See also<\/h2>/' $temp/HTML/$id"_goofs.html" | sed 's/>/>\
/g' > $temp/HTML/$id"_Goofs_00.txt"
awk '/<div\ id\=\"goofs_content\" class\=\"header\">/,/<h2>See also<\/h2>/' $temp/HTML/$id"_Goofs_00.txt" > $temp/HTML/$id"_Goofs_tmp00.txt"

awk '/<div\ class\=\"sodatext\">/{p=1; s=$0}
p && /<\/div>/{print $0 FS s; s=""; p=0}
p' $temp/HTML/$id"_Goofs_tmp00.txt" | sed -e 's/<\/div>\ \ \ \<div\ class\=\"sodatext\">/<\/li>/g' |sed -e 's/<div\ class\=\"sodatext\">/<li\ class\=\"list-group-item\">/g' | sed -e 's/<\/div>\ \ \ \ \ \ \ \ \ <li\ class\=\"list-group-item\">/<\/li>/g' | awk 'NF > 0' > $temp/HTML/Goofs_lines/_output/GOOFS_TEMPS.txt

printf '<h1 id="goofs">Goofs</h1><div aria-label="Basic main" class="btn-group" role="group">' > $temp/HTML/$id"_Goofs_def.txt"
printf '<a class="btn btn-secondary" href="#the_film" type="button">Back to the film<span class="glyphicon glyphicon-arrow-up"></span></a></div>' >> $temp/HTML/$id"_Goofs_def.txt"
printf '<ul class="list-group">' >> $temp/HTML/$id"_Goofs_def.txt"
cat $temp/HTML/Goofs_lines/_output/GOOFS_TEMPS.txt >> $temp/HTML/$id"_Goofs_def.txt"

printf '</ul>' >> $temp/HTML/$id"_Goofs_def.txt"

tr '\n' ' ' < $temp/HTML/$id"_Goofs_def.txt" > $temp/CSV_FIELDS/$id"_goofs_tmps.csv"
printf '%s\n' 0a 'goofs' . x | ex $temp/CSV_FIELDS/$id"_goofs_tmps.csv"
fi

if [[ -f $temp/CSV_FIELDS/$id"_goofs_tmps.csv" ]]; then
mv $temp/CSV_FIELDS/$id"_goofs_tmps.csv" $temp/CSV_FIELDS/$id"_goofs.csv"
fi


# Also Known As - aka
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Also Known As - aka"
awk '/<table class\=\"ipl-zebra-list akas-table-test-only\">/,/<\/table>/' $temp/HTML/$id"_releaseinfo.html" > $temp/HTML/$id"_aka.html"
tr -d '\n'  < $temp/HTML/$id"_aka.html"  |awk '{gsub(/ipl-zebra-list akas-table-test-only/,"col-md-6",$0)}1' | awk '{gsub(/aka-item__name/,"col-md-6",$0)}1' | awk '{gsub(/ipl-zebra-list__item aka-item/,"col-md-12",$0)}1' | awk '{gsub(/aka-item__title/,"col-md-6",$0)}1' | awk '{gsub(/<tr/,"<div",$0)}1' | awk '{gsub(/<\/tr/,"<\/div",$0)}1'| awk '{gsub(/<td/,"<div",$0)}1' | awk '{gsub(/<\/td/,"<\/div",$0)}1' | sed -e '1s/^/<h3 id\=\"aka\">Also Known As<\/h3>/' > $temp/CSV_FIELDS/$id"_aka.csv"
printf '%s\n' 0a 'aka' . x | ex $temp/CSV_FIELDS/$id"_aka.csv"

if grep -q 'Be the first to contribute' $temp/CSV_FIELDS/$id"_aka.csv"
then
echo  "Cleaning the csv file to only the header"
printf "aka
" > $temp/CSV_FIELDS/$id"_aka.csv"
else
echo -e "${white}---> "$id"_aka.csv\t\t\t\t\t\t\t\t\t\t${green}Contains information"
printf '<a class="btn btn-secondary" href="#aka" type="button">Aka</a>' >> $temp/HTML/$id"_Button_Main_button.txt"
fi

# Filming Locations
#echo "${white}---> Locations system"
perl -0777 -pe 's/<div class\=\"did-you-know-actions.*?<\/div>//gs' $temp/HTML/$id"_locations.html" > $temp/HTML/$id"_locations_01.html"
awk '/<section\ id\=\"filming_locations\">/,/<\/section>/' $temp/HTML/$id"_locations_01.html" | awk '!/<section\ id\=\"filming_locations\">/' | awk '!/<\/section>/' | awk '!/<a\ class\=\"ipl-header__edit-link\"/' > $temp/HTML/$id"_locations_02.html"
#remove all until </header> + tex cleaning adding
awk 'p; /<\/header>/ {p=1}' $temp/HTML/$id"_locations_02.html" | tr -d "\n" | awk -v OFS=">" -F'> *' 'gsub(/^ */,"", $1)' | awk '{gsub(/<\/div>/,"<\/div>@");}1' > $temp/HTML/$id"_locations_03.html"
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Locations"
# class Locations ( Locations )
TAB=$'\t'
awk '/<a\ /{p=1; s=$0}
p && /<\/a>/{print $0 FS s; s=""; p=0}
p' $temp/HTML/$id"_locations_03.html" | awk -F'<\/a>' '{$1=$1}1' OFS='\nTo_REMOVE_SOON1' | awk -F'<dd>' '{$1=$1}1' OFS='\nTo_REMOVE_SOON2' | awk -F'\(' '{$1=$1}1' OFS='\ntext_scene\(' | awk -F'<\/dd>' '{$1=$1}1' OFS='\nTo_REMOVE_SOON1' | awk -F'itemprop\=' '{$1=$1}1' OFS='\nTo_REMOVE_SOON2' | awk -F'url' '{$1=$1}1' OFS='\nTo_REMOVE_SOON4' | awk '!/^To_REMOVE_SOON2/' | awk '!/^To_REMOVE_SOON1/' | awk '!/^To_REMOVE_SOON3/' | awk -F'>' '{$1=$1}1' OFS='\ntext_markup' | awk -F'text_markup' '{print "<a\ class\=\"list-group-item\ list-group-item-action\"\ target\=\"_blank\"\ rel\=\"noopener\ noreferrer\" href\=\"http:\/\/maps.google.com\/\?t\=\k\&q\="$0"\">"$0"<\/a>" }' | awk -F'text_scene' '{$1=$1}1' OFS='\ntext_scene' | sed -e '/^$/d;/q=$/d'  | awk '!/<h1<\/a><\/h4>/' | awk -F't' '{$1=$1}1' OFS='\nTo_REMOVE_SOON6' | awk -F'\ >' '{$1=$1}1' OFS='\nTo_REMOVE_SOON6' | awk -F'\ <\/a>' '{$1=$1}1' OFS='\nTo_REMOVE_SOON6' | awk '!/To_REMOVE_SOON6/' | awk '!/To_REMOVE_SOON4/' | awk -F'text_markup' '{print $1$2$3}' | awk '!/\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \">/' | awk '{gsub(/\)/,"\)<\/p>");}1' | awk '{gsub(/\(/,"<p class\=\"scene_loc\">\(");}1'| awk '{gsub(/text_scene/,"");}1' | awk 'NR>3' | awk '/<p/{print ""}{printf $0}' | tr -d '\n' | sed -e 's/<\/a><p/<p/g' | sed -e 's/<\/p>/<\/p><\/a>/g' | sed 's/[)]<\/p><\/a><p class="scene_loc">[(]/)<\/p><p  class="scene_loc">(/g' | sed 's/[)]<\/p><\/a> "><p class="scene_loc">[(]/)<\/p><p class="scene_loc">(/g' > $temp/HTML/$id"_LOCATIONS.txt"

sed 's/<a/\
<a/g' $temp/HTML/$id"_LOCATIONS.txt" | sort -u > $temp/HTML/$id"_LOCATIONS01.txt"
mv $temp/HTML/$id"_LOCATIONS01.txt" $temp/HTML/$id"_LOCATIONS.txt"

printf '<h3 id="locations">Locations</h3><ul class="list-group">' > $temp/HTML/$id"_LOCATIONS_temps.txt"
cat $temp/HTML/$id"_LOCATIONS.txt" >> $temp/HTML/$id"_LOCATIONS_temps.txt"
printf '</ul>' >> $temp/HTML/$id"_LOCATIONS_temps.txt"
tr -d '\n' < $temp/HTML/$id"_LOCATIONS_temps.txt" > $temp/CSV_FIELDS/$id"_locations.csv"
printf '%s\n' 0a 'Location1' . x | ex $temp/CSV_FIELDS/$id"_locations.csv"

if grep -q 'Be the first to contribute' $temp/CSV_FIELDS/$id"_locations.csv"
then
echo  "---> Cleaning the csv file to only header"
printf "Location1
" > $temp/CSV_FIELDS/$id"_locations.csv"
else
echo -e "${white}---> $id"_locations.csv"\t\t\t\t\t\t\t\t\t${green}Contains information"
printf '<a class="btn btn-secondary" href="#locations" type="button">Locations</a>' >> $temp/HTML/$id"_Button_Main_button.txt"
fi


# Filming dates
awk '/<section id\=\"filming_dates\">/,/<\/section>/' $temp/HTML/$id"_locations.html" | awk '!/<section id\=\"filming_dates\">/' | awk '!/<h4 class\=\"ipl-list-title\">Filming Dates<\/h4>/' | awk '!/<ul class\=\"ipl-zebra-list\">/' | awk '!/<li class\=\"ipl-zebra-list__item\">/' | awk '!/<\/li>/' | awk '!/<\/ul>/' | awk '!/<\/section>/' | sed -e 's/^ *//' > $temp/HTML/$id"_filming_dates.txt"
tr '\n' @ < $temp/HTML/$id"_filming_dates.txt" > $temp/HTML/$id"_filming_dates_01.txt"
sed 's/.$//' < $temp/HTML/$id"_filming_dates_01.txt" > $temp/CSV_FIELDS/$id"_filming_dates.csv"
printf '%s\n' 0a 'filming_dates' . x | ex $temp/CSV_FIELDS/$id"_filming_dates.csv"

# Production dates
awk '/<section id\=\"production_dates\">/,/<\/section>/' $temp/HTML/$id"_locations.html" | awk '!/<section id\=\"production_dates\">/' | awk '!/<h4 class\=\"ipl-list-title\">Production Dates<\/h4>/' | awk '!/<ul class\=\"ipl-zebra-list\">/' | awk '!/<li class\=\"ipl-zebra-list__item\">/' | awk '!/<\/li>/' | awk '!/<\/ul>/' | awk '!/<\/section>/' | sed -e 's/^ *//' > $temp/HTML/$id"_production_dates.txt"
tr '\n' @ < $temp/HTML/$id"_production_dates.txt" > $temp/HTML/$id"_production_dates_01.txt"
sed 's/.$//' < $temp/HTML/$id"_production_dates_01.txt" > $temp/CSV_FIELDS/$id"_production_dates.csv"
printf '%s\n' 0a 'production_dates' . x | ex $temp/CSV_FIELDS/$id"_production_dates.csv"


# Film Music
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Film Music"
awk '/<h4 class\=\"dataHeaderWithBorder\">Music by&nbsp\;<\/h4>/,/<\/table>/' $temp/HTML/$id".html" > $temp/HTML/$id"_Music.html"
python2.7 _html2csv.py $temp/HTML/$id"_Music.html" &> /dev/null
awk -F ',' '{ print $1}' OFS="|" $temp/HTML/$id"_Music.csv" > $temp/HTML/$id"_Music_01.txt"
cat $temp/HTML/$id"_Music_01.txt" | awk '{gsub(/\"\ /,"",$0)}1' | awk '{gsub(/\ \"/,"",$0)}1' | tr '\n' @  | awk -F'@' '{print $1, $2 , $3}' OFS='@' >  $temp/CSV_FIELDS/$id"_Music.csv"
printf '%s\n' 0a 'music' . x | ex $temp/CSV_FIELDS/$id"_Music.csv"

#Producers
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Produced by"
awk '/<h4 class\=\"dataHeaderWithBorder\">Produced by&nbsp;/,/<\/table>/' $temp/HTML/$id".html" > $temp/HTML/$id"_Poducer.html"
python2.7 _html2csv.py $temp/HTML/$id"_Poducer.html" &> /dev/null
awk -F ',' '{ print $1}' OFS="|" $temp/HTML/$id"_Poducer.csv" > $temp/HTML/$id"_Poducer_01.txt"
cat $temp/HTML/$id"_Poducer_01.txt" | awk '{gsub(/\"\ /,"",$0)}1' | awk '{gsub(/\ \"/,"",$0)}1' | tr '\n' @ | awk -F'@' '{print $1, $2 , $3}' OFS='@' > $temp/CSV_FIELDS/$id"_Poducer.csv"
printf '%s\n' 0a 'poducers' . x | ex $temp/CSV_FIELDS/$id"_Poducer.csv"

#film Cast
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Film Cast"
awk '/<h4 name\=\"cast\" id\=\"cast\"/,/<\/table>/' $temp/HTML/$id".html" > $temp/HTML/$id"_full_cast.html"
python2.7 _html2csv.py $temp/HTML/$id"_full_cast.html" &> /dev/null
cat $temp/HTML/$id"_full_cast.csv" | awk '{gsub(/\" \",\" /,"\n",$0)}1' > $temp/HTML/$id"_full_cast_tmp_00.txt"
cat $temp/HTML/$id"_full_cast_tmp_00.txt" | awk '{gsub(/\"Rest of cast listed alphabetically\:\"/,"",$0)}1' > $temp/HTML/$id"_full_cast_tmp_01.txt"
cat $temp/HTML/$id"_full_cast_tmp_01.txt" | awk '{gsub(/\ \","\ ...\ \",\"\ /,"\|",$0)}1' >  $temp/HTML/$id"_full_cast_tmp_02.txt"
echo "${white}---> Replace new line by |"
awk '$1=$1' ORS='|' $temp/HTML/$id"_full_cast_tmp_02.txt" > $temp/HTML/$id"_full_cast_tmp_03.txt"
cat $temp/HTML/$id"_full_cast_tmp_03.txt" | awk '{gsub(/\"\"\|/,"",$0)}1' >  $temp/HTML/$id"_full_cast_tmp_04.txt"
cat $temp/HTML/$id"_full_cast_tmp_04.txt" | awk '{gsub(/\ \/\ /,"\|\|",$0)}1' >  $temp/HTML/$id"_full_cast_tmp_05.txt"
cat $temp/HTML/$id"_full_cast_tmp_05.txt" | awk '{gsub(/ \(uncredited\) \"/,"",$0)}1' >  $temp/HTML/$id"_full_cast_tmp_06.txt"
cat $temp/HTML/$id"_full_cast_tmp_06.txt" | awk '{gsub(/ \"/,"",$0)}1' >  $temp/HTML/$id"_full_cast_tmp_07.txt"
cat $temp/HTML/$id"_full_cast_tmp_07.txt" | awk '{gsub(/,\"\ ...,\"\ /,"|",$0)}1' >  $temp/HTML/$id"_full_cast_tmp_08.txt"

if [ -s $temp/HTML/$id"_full_cast_tmp_08.txt" ]
then
echo -e "${white}---> Actors & characters\t\t\t\t\t\t\t\t\t${green}Are present"
else
echo -e "${white}---> Actors & characters\t\t\t\t\t\t\t\t\t${red}Are not present"

touch $temp/HTML/$id"_full_cast_tmp_08.txt"
printf "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||" >  $temp/HTML/$id"_full_cast_tmp_08.txt"
fi

echo -e "${white}---> Remplacement (en place) du header${orange}\t\t\t\t\t\t\t\tActors -> Characters 105 Cells X 2 a coller"
awk 'BEGIN{print " "}{print}' $temp/HTML/$id"_full_cast_tmp_08.txt" > $temp/HTML/$id"_full_cast_tmp_09.txt"
sed -i.bak "1 s/^.*$/Ac1|Ch1|Ac2|Ch2|Ac3|Ch3|Ac4|Ch4|Ac5|Ch5|Ac6|Ch6|Ac7|Ch7|Ac8|Ch8|Ac9|Ch9|Ac10|Ch10|Ac11|Ch11|Ac12|Ch12|Ac13|Ch13|Ac14|Ch14|Ac15|Ch15|Ac16|Ch16|Ac17|Ch17|Ac18|Ch18|Ac19|Ch19|Ac20|Ch20|Ac21|Ch21|Ac22|Ch22|Ac23|Ch23|Ac24|Ch24|Ac25|Ch25|Ac26|Ch26|Ac27|Ch27|Ac28|Ch28|Ac29|Ch29|Ac30|Ch30|Ac31|Ch31|Ac32|Ch32|Ac33|Ch33|Ac34|Ch34|Ac35|Ch35|Ac36|Ch36|Ac37|Ch37|Ac38|Ch38|Ac39|Ch39|Ac40|Ch40|Ac41|Ch41|Ac42|Ch42|Ac43|Ch43|Ac44|Ch44|Ac45|Ch45|Ac46|Ch46|Ac47|Ch47|Ac48|Ch48|Ac49|Ch49|Ac50|Ch50|Ac51|Ch51|Ac52|Ch52|Ac53|Ch53|Ac54|Ch54|Ac55|Ch55|Ac56|Ch56|Ac57|Ch57|Ac58|Ch58|Ac59|Ch59|Ac60|Ch60|Ac61|Ch61|Ac62|Ch62|Ac63|Ch63|Ac64|Ch64|Ac65|Ch65|Ac66|Ch66|Ac67|Ch67|Ac68|Ch68|Ac69|Ch69|Ac70|Ch70|Ac71|Ch71|Ac72|Ch72|Ac73|Ch73|Ac74|Ch74|Ac75|Ch75|Ac76|Ch76|Ac77|Ch77|Ac78|Ch78|Ac79|Ch79|Ac80|Ch80|Ac81|Ch81|Ac82|Ch82|Ac83|Ch83|Ac84|Ch84|Ac85|Ch85|Ac86|Ch86|Ac87|Ch87|Ac88|Ch88|Ac89|Ch89|Ac90|Ch90|Ac91|Ch91|Ac92|Ch92|Ac93|Ch93|Ac94|Ch94|Ac95|Ch95|Ac96|Ch96|Ac97|Ch97|Ac98|Ch98|Ac99|Ch99|Ac100|Ch100|Ac101|Ch101|Ac102|Ch102|Ac103|Ch103|Ac104|Ch104|Ac105|Ch105/" $temp/HTML/$id"_full_cast_tmp_09.txt"

awk -F '|' '{ print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $100, $101, $102, $103, $104, $105, $106, $107, $108, $109, $110, $111, $112, $113, $114, $115, $116, $117, $118, $119, $120, $121, $122, $123, $124, $125, $126, $127, $128, $129, $130, $131, $132, $133, $134, $135, $136, $137, $138, $139, $140, $141, $142, $143, $144, $145, $146, $147, $148, $149, $150, $151, $152, $153, $154, $155, $156, $157, $158, $159, $160, $161, $162, $163, $164, $165, $166, $167, $168, $169, $170, $171, $172, $173, $174, $175, $176, $177, $178, $179, $180, $181, $182, $183, $184, $185, $186, $187, $188, $189, $190, $191, $192, $193, $194, $195, $196, $197, $198, $199, $200, $201, $202, $203, $204, $205, $206, $207, $208, $209, $210}' OFS="|" $temp/HTML/$id"_full_cast_tmp_09.txt" | tr -d '\",' > $temp/CSV_FIELDS/$id"_full_cast.csv"

# Company
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}company"
awk '/<h4 class\=\"inline\">Production\ Co:<\/h4>/,/<span class\=\"see-more\ inline\">/' $temp/HTML/$id"_main.html" | awk '!/<h4 class\=\"inline\">Production\ Co:<\/h4>/' | awk -F'<\/a>' '{print $1}' | awk 'BEGIN{n=1}NR<=n{next}1' | awk '{gsub(/>\ /,"",$0)}1' > $temp/HTML/$id"_company.txt"
tr '\n' '@' < $temp/HTML/$id"_company.txt" > $temp/HTML/$id"_company_01.txt"
echo "${white}---> Remove the last space on company_O1.txt"
sed 's/.$//' < $temp/HTML/$id"_company_01.txt" > $temp/CSV_FIELDS/$id"_company.csv"
printf '%s\n' 0a 'company' . x | ex $temp/CSV_FIELDS/$id"_company.csv"

# Release Date France
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Release Date France"
cat $temp/HTML/$id"_main.html" | tr -d '\n' | awk -F'Release date' '{print $2}'|awk -F'<a' '{print $2}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}' > $temp/CSV_FIELDS/$id"_releasedate.csv"
printf '%s\n' 0a 'releasedate' . x | ex $temp/CSV_FIELDS/$id"_releasedate.csv"

# Rating
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Rating"
cat $temp/HTML/$id"_main.html" | tr -d '\n' | awk '/>IMDb RATING<\/div>/,/<\/div>/'  | awk -F'AggregateRatingButton__RatingScore-sc-1ll29m0-1 iTLWoV' '{print $2}'| awk -F'>' '{print $2}'| awk -F'<' '{print $1}' > $temp/CSV_FIELDS/$id"_rating.csv"
printf '%s\n' 0a 'rating' . x | ex $temp/CSV_FIELDS/$id"_rating.csv"
# stills pictures stills
# stills list
if ls $file_no_ext_imdb"_stills"/*.jpg > /dev/null 2>&1
then
echo -e "${white}---> Stills pictures \"_stills\" were found in\t\t:\t\t\t\t\t${orange}"$file_no_ext_imdb"_stills/*"
ls "$file_no_ext_imdb"_stills/*.jpg | sed 's:.*/::' 1> $temp/HTML/$id"_stills_00.txt"
else
echo -e "${white}---> Stills pictures in \"_stills\"\t\t\t:\t\t\t\t\t${orange}None"
touch $temp/HTML/$id"_stills_00.txt"
fi
tr '\n' @ < $temp/HTML/$id"_stills_00.txt" > $temp/HTML/$id"_stills_01.txt"
tr -d '\n' < $temp/HTML/$id"_stills_01.txt" > $temp/HTML/$id"_stills_02.txt"
sed 's/.$//' < $temp/HTML/$id"_stills_02.txt" >$temp/CSV_FIELDS/$id"_stills.csv"
printf '%s\n' 0a 'stills' . x | ex $temp/CSV_FIELDS/$id"_stills.csv"

# shooting pictures shtg
# shtg list
if ls "$file_no_ext_imdb"_shtg/*.jpg > /dev/null 2>&1
then
echo -e "${white}---> Shooting pictures \"_shtg\" were found in\t\t:\t\t\t\t\t${orange}"$file_no_ext_imdb"_shtg/*"
ls "$file_no_ext_imdb"_shtg/*.jpg | sed 's:.*/::' > "$temp"/HTML/"$id"shtg_00.txt
else
echo -e "${white}---> Sooting pictures in \"_shtg\"\t\t\t:\t\t\t\t\t${orange}None"
touch "$temp"/HTML/"$id"shtg_00.txt
fi
tr '\n' @ < "$temp"/HTML/"$id"shtg_00.txt > "$temp"/HTML/"$id"shtg_01.txt
tr -d '\n' < "$temp"/HTML/"$id"shtg_01.txt > "$temp"/HTML/"$id"shtg_02.txt
sed 's/.$//' < "$temp"/HTML/"$id"shtg_02.txt > "$temp"/CSV_FIELDS/"$id"_shtg.csv
printf '%s\n' 0a 'shtg' . x | ex "$temp"/CSV_FIELDS/"$id"_shtg.csv

# poster
# ls "$file_no_ext_imdb"_posters/*.jpg > $temp/HTML/$id"poster_name.txt"
ls "$file_no_ext_imdb"_posters/*.jpg | sed 's:.*/::' > "$temp"/HTML/"$id"poster_name00.txt
tr '\n' @ < "$temp"/HTML/"$id"poster_name00.txt > "$temp"/HTML/"$id"poster_name_01.txt
tr -d '\n' < "$temp"/HTML/"$id"poster_name_01.txt > "$temp"/HTML/"$id"poster_name.txt
poster=$(cat "$temp"/HTML/"$id"poster_name.txt | sed 's/.$//')
printf "poster
$poster
" > "$temp/CSV_FIELDS/$id"_poster.csv

# trailers movies
# shtg list
if ls "$file_no_ext_imdb"_trailers/*.mp4 > /dev/null 2>&1
then
echo -e "${white}---> Trailers movies in \"_trailers\" were found in \t:\t\t\t\t\t${orange}"$file_no_ext_imdb"_traillers"
ls $file_no_ext_imdb"_trailers"/*.mp4 | sed 's:.*/::' > $temp/HTML/$id"_trailers_00.txt"
else
echo -e "${white}---> Trailers movies in \"_trailers\"\t\t\t:\t\t\t\t\t${orange}None"
touch $temp/HTML/$id"_trailers_00.txt"
fi
tr '\n' @ < $temp/HTML/$id"_trailers_00.txt" > $temp/HTML/$id"_trailers_01.txt"
tr -d '\n' < $temp/HTML/$id"_trailers_01.txt" > $temp/HTML/$id"_trailers_02.txt"
sed 's/.$//' < $temp/HTML/$id"_trailers_02.txt" > $temp/CSV_FIELDS/$id"_trailers.csv"
printf '%s\n' 0a 'trailer' . x | ex "$temp/CSV_FIELDS/$id"_trailers.csv


# making of movies
# shtg list
if ls "$file_no_ext_imdb"_mof/*.mp4 > /dev/null 2>&1
then
echo -e "${white}---> Making of movies in \"_mof\" were found\t\t:\t\t\t\t\t${orange}"$file_no_ext_imdb"_mof/*"
ls "$file_no_ext_imdb"_mof/*.mp4 | sed 's:.*/::' > "$temp"/HTML/"$id"_mof_00.txt
else
echo -e "${white}---> Making of movies \"_mof\"\t\t\t\t:\t\t\t\t\t${orange}None"
touch "$temp"/HTML/"$id"_mof_00.txt
fi

tr '\n' @ < "$temp"/HTML/"$id"_mof_00.txt > "$temp/"HTML/"$id"_mof_01.txt
tr -d '\n' < $temp/HTML/$id"_mof_01.txt" > $temp/HTML/$id"_mof_02.txt"
sed 's/.$//' < $temp/HTML/$id"_mof_02.txt" > $temp/CSV_FIELDS/$id"_mof.csv"
printf '%s\n' 0a 'mof' . x | ex $temp/CSV_FIELDS/$id"_mof.csv"


## Director of photgraphy DOP
#echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Director of photgraphy D.O.P"
#awk '/<h4 class\=\"dataHeaderWithBorder\">Cinematography/,/<\/table>/' $temp/HTML/$id".html" > $temp/HTML/$id"_DOP.html"
#python2.7 _html2csv.py $temp/HTML/$id"_DOP.html" &> /dev/null
#awk -F',' '{print $1}' $temp/HTML/$id"_DOP.csv" > $temp/HTML/$id"_DOP_00.txt"
#awk '{gsub(/\" /,"",$0)}1' $temp/HTML/$id"_DOP_00.txt" |awk '{gsub(/\ "/,"",$0)}1' | awk '{gsub(/\"\"/,"",$0)}1' | awk 'NF > 0' > $temp/HTML/$id"_DOP_01.txt"
#tr '\n' @ < $temp/HTML/$id"_DOP_01.txt" > $temp/HTML/$id"_DOP_02.txt"
#sed 's/.$//' < $temp/HTML/$id"_DOP_02.txt" > $temp/CSV_FIELDS/$id"_DOP.csv"
#printf '%s\n' 0a 'dop' . x | ex $temp/CSV_FIELDS/$id"_DOP.csv"


echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Crazy Credits"
# Crazy Credits
awk '/<h4>Crazy Credits<\/h4>/,/<\/div>/' $temp/HTML/$id"_main.html" | sed -e "s/^[ \t]*//"  | awk '!/^<h4>/' | awk -F'\ \ \ \ \ \ \ \ ' '{$1=$1}1' OFS='\nTo_REMOVE' | sed -e '/To_REMOVE/{N;N;N;N;d;}' | sed -e '1s/^/<h3\ id\=\"crazy_credits\">Crazy Credits<\/h3>/' > $temp/CSV_FIELDS/$id"_crazy_credits.csv"
printf '%s\n' 0a 'crazy_credits' . x | ex $temp/CSV_FIELDS/$id"_crazy_credits.csv"

#For Taxonomy People
#Film Cast
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}Film Cast Taxonomy"
# class name ( Artists )
awk '/<td\ class=\"primary_photo\"/{p=1; s=$0}
p && /<\/td>/{print $0 FS s; s=""; p=0}
p' $temp/HTML/$id".html" | awk '/photo\"\>$/ { printf("%s\t", $0); next } 1' | awk '/\/\"$/ { printf("%s\t", $0); next } 1' | awk -F'<a\ href\=\"\/name' '{$1=$1}1' OFS='\n\/name' | awk -F'><img\ heigh' '{$1=$1}1' OFS='\nTo_REMOVE_SOON1' | awk -F'alt\=\"' '{$1=$1}1' OFS='\nFull_name' | awk -F'title\=\"' '{$1=$1}1' OFS='\nTo_REMOVE_SOON2'| awk -F'loadlate\=\"https' '{$1=$1}1' OFS='\nhttps' | awk -F'@.' '{$1=$1}1' OFS='\nTo_REMOVE_SOON3' | awk -F'_V1_' '{$1=$1}1' OFS='\nTo_REMOVE_SOON3' |awk '!/^To_REMOVE_SOON2/' | awk '!/^To_REMOVE_SOON3/' | awk '!/^To_REMOVE_SOON1/' | awk '/\/\"\t$/ { printf("%s\t", $0); next } 1' | awk -F'\/\"\t\tFull_name' '{print $1"/n"$2"/n"$3"/nEND_LINE"}' | awk '/nEND_LINE$/ { printf("%s\t", $0); next } 1' | awk -F'\"\ \thttps' '{print $1, $2}' OFS='|https' | awk -F'\t\/name' '{$1=$1}1' OFS='\n\/name' | awk -F'\/n' '{print $1,$3, $2, $3, $4, $5, $6}' OFS='\/n' | awk -F';\"\ \/n\/nEND_LINE\thttps' '{print $1, $2}' OFS='|https' | awk -F'\/na' '{print $1"|na"$2}' |awk '{ print substr($0,2) }'| sed -e 's/name\//\/name\//g' | awk -F'\/n' '{print $1"/n"$2"/n"$3, $4, $6, $7}' OFS='\|' | tr -d '\t' | sed -e 's/\" \|END_LINEhttps/\|https/g' | awk '{gsub(/\"\ \|END_LINE\|https\|/,"",$0)}1' | awk '{gsub(/\|https\|/,"",$0)}1' | awk -F'\|' '{print $1, $2, $3, $4}' OFS='\|' | awk '!/<td/' > $temp/CSV_FIELDS/$id"_P_artist_people.csv"

#class name ( DOP )
awk '
/<td\ class=\"name\"/{p=1; s=$0}
p && /<\/td>/{print $0 FS s; s=""; p=0}
p' $temp/HTML/$id"_DOP.html" | awk '!/^\ \ \ \ \ \ \ \ \ \ \ /' | awk '{gsub(/\<a\ href\=\"/,"",$0)}1' | awk '/\/\"$/ { printf("%s\t", $0); next } 1' | awk '!/<\/td>/' | awk '!/<td/' | awk -F'\/\"\t>\ ' '{print $1, $1"|"$2}' | awk -F'/name\/' '{print $2"\/name\/"$3$4}' | awk -F'\ \/' '{print $1"/"$2}' | awk -F'\/' '{print $1"|""/"$2"/"$3"|"$4}' > $temp/CSV_FIELDS/$id"_P_DOP_people.csv"

#class name ( Music )
awk '
/<td\ class=\"name\"/{p=1; s=$0}
p && /<\/td>/{print $0 FS s; s=""; p=0}
p' $temp/HTML/$id"_Music.html" | awk '!/^\ \ \ \ \ \ \ \ \ \ \ /' | awk '{gsub(/\<a\ href\=\"/,"",$0)}1' | awk '/\/\"$/ { printf("%s\t", $0); next } 1' | awk '!/<\/td>/' | awk '!/<td/' | awk -F'\/\"\t>\ ' '{print $1, $1"|"$2}' | awk -F'/name\/' '{print $2"\/name\/"$3$4}' | awk -F'\ \/' '{print $1"/"$2}' | awk -F'\/' '{print $1"|""/"$2"/"$3"|"$4}' > $temp/CSV_FIELDS/$id"_P_Music_people.csv"

#class name ( Editor )
awk '
/<td\ class=\"name\"/{p=1; s=$0}
p && /<\/td>/{print $0 FS s; s=""; p=0}
p' $temp/HTML/$id"_Editors.html" | awk '!/^\ \ \ \ \ \ \ \ \ \ \ /' | awk '{gsub(/\<a\ href\=\"/,"",$0)}1' | awk '/\/\"$/ { printf("%s\t", $0); next } 1' | awk '!/<\/td>/' | awk '!/<td/' | awk -F'\/\"\t>\ ' '{print $1, $1"|"$2}' | awk -F'/name\/' '{print $2"\/name\/"$3$4}' | awk -F'\ \/' '{print $1"/"$2}' | awk -F'\/' '{print $1"|""/"$2"/"$3"|"$4}' > $temp/CSV_FIELDS/$id"_P_Editors_people.csv"

#class name ( Writing_Credits )
awk '
/<td\ class=\"name\"/{p=1; s=$0}
p && /<\/td>/{print $0 FS s; s=""; p=0}
p' $temp/HTML/$id"_Writing_Credits.html" | awk '!/^\ \ \ \ \ \ \ \ \ \ \ /' | awk '{gsub(/\<a\ href\=\"/,"",$0)}1' | awk '/\/\"$/ { printf("%s\t", $0); next } 1' | awk '!/<\/td>/' | awk '!/<td/' | awk -F'\/\"\t>\ ' '{print $1, $1"|"$2}' | awk -F'/name\/' '{print $2"\/name\/"$3$4}' | awk -F'\ \/' '{print $1"/"$2}' | awk -F'\/' '{print $1"|""/"$2"/"$3"|"$4}' > $temp/CSV_FIELDS/$id"_P_Writing_Credits_people.csv"

#class name ( SetDesigner )
echo -e "${white}---> Processing...\t\t\t\t\t\t\t\t\t\t${orange}SetDesigner"
awk '/>Production Design by&nbsp\;<\/h4>/,/<\/table>/' $temp/HTML/$id".html" > $temp/HTML/$id"_SetDesigner.html"
python2.7 _html2csv.py $temp/HTML/$id"_SetDesigner.html" &> /dev/null
awk -F',' '{print $1}' $temp/HTML/$id"_SetDesigner.csv" > $temp/HTML/$id"_SetDesigner_00.txt"
awk '{gsub(/\" /,"",$0)}1' $temp/HTML/$id"_SetDesigner_00.txt" |awk '{gsub(/\ "/,"",$0)}1' | awk '{gsub(/\"\"/,"",$0)}1' | awk 'NF > 0' > $temp/HTML/$id"_SetDesigner_01.txt"
tr '\n' @ < $temp/HTML/$id"_SetDesigner_01.txt" > $temp/HTML/$id"_SetDesigner_02.txt"
sed 's/.$//' < $temp/HTML/$id"_SetDesigner_02.txt" > $temp/CSV_FIELDS/$id"_SetDesigner.csv"
printf '%s\n' 0a 'SetDesigner' . x | ex $temp/CSV_FIELDS/$id"_SetDesigner.csv"

#class name ( Makeup )
cat $temp/HTML/"$id".html |tr -d '\n' | awk -F'id="make_up_department"' '{print $2}'|awk -F'<table' '{print "<table"$2}' | awk -F'</tbody>' '{print $1}'|sed 's/<tr>/\
/g'|tr -d '\n'| sed 's/\/name/https:\/\/www.imdb.com\/name/g' | sed 's/a href/a class="makupclass" data-toggle="tooltip" data-placement="right" title="" data-original-title="Sur IMDB" href/g'| awk '{print $0"</table>"}' > $temp/CSV_FIELDS/$id"_Makeup.csv"
printf '%s\n' 0a 'Makeup' . x | ex $temp/CSV_FIELDS/$id"_Makeup.csv"


#For Wiki_infos fr
mkdir -p $temp/WIKI_INFO
awk -F'\t' '{if ('/$id/') {print $3} else {}}' _wikipedia_fr_imdb_id.tsv > $temp/HTML/$id"_fr_wikipedia_url.txt"
fr_wikipedia_url=$(cat $temp/HTML/$id"_fr_wikipedia_url.txt")

if grep -q 'fr.wikipedia.org' $temp/HTML/$id"_fr_wikipedia_url.txt"
then
printf '<a class="btn btn-secondary button-nbnw" href="/title/'$id'/wiki_info" type="button">Wiki Info</a>' >> $temp/HTML/$id"_Button_Main_button.txt"
echo  -e "${white}---> wget\t\t\t\t\t\t\t\t\t\t\t${orange}$fr_wikipedia_url"
if [ -s "$temp/HTML/$id"_wikipedia.html"" ]
then
cp $temp/HTML/$id"_wikipedia.html" $temp/WIKI_INFO/$id"_wikipedia.html"
else
echo  -e "${white}---> wget\t\t\t\t\t\t\t\t\t\t\t${orange}$fr_wikipedia_url"
wget -O $temp/HTML/$id"_wikipedia.html" $fr_wikipedia_url
fi

echo "wiki_name
$titlefr $year (wiki info)" > $temp/WIKI_INFO/$id"_wiki_name.csv"
echo "wiki_id
$id"_wkid"" > $temp/WIKI_INFO/$id"_wiki_id.csv"

echo "wiki_url
/title/$id/wiki_info" > $temp/WIKI_INFO/$id"_wiki_url.csv"


awk '/<body/,/<\/body>/' $temp/HTML/$id"_wikipedia.html" | awk  '{gsub(/href\=\"\/wiki\//,"target\=\"_blank\"\ rel\=\"noopener\ noreferrer\" data-toggle\=\"tooltip\"\ data-placement\=\"right\"\ title\=\"Sur\ Wikip\\&eacute\;dia\" href\=\"https\:\/\/fr.wikipedia.org\/wiki\/",$0)}1' | perl -lpwe 's/\[.*?\]//g' | sed '/<h3><span id\=\"Vid.C3.A9ographie\">/,/<\/script>/d' | sed '/<script/,/<\/script>/d' | awk '!/mw-content-text/' | awk '!/href\=\"#p-search\"/' | awk '!/#Vidéographie\"/' | awk '{sub(/href\=\"\/w\/index\.php.*class\=\"new\"/,"data-toggle\=\"tooltip\"\ data-placement\=\"right\"")}8' | awk '!/<h1\ id\=\"firstHeading\"/' | awk '!/href\=\"#Notes_et/' > $temp/HTML/$id"_wikipedia_01.html"

tr '\n' ' ' < $temp/HTML/$id"_wikipedia_01.html" | awk -F'<div\ class\=\"navbox-container' '{print $1 "<\/body>"}' | awk -F'<h2><span\ id\=\"Notes_et' '{print $1 "<\/body>"}' > $temp/WIKI_INFO/$id"_wiki_body.csv"
printf '%s\n' 0a 'wiki_body' . x | ex $temp/WIKI_INFO/$id"_wiki_body.csv"

#echo '<a class="wikipage" type="button" href="/title/$id/wiki_info">Wiki fr</a><a class="go_wikipedia" type="button" href="$fr_wikipedia_url">Read on fr Wikipedia</a>' >> $id"_button.html"
paste -d'|' $temp/WIKI_INFO/$id"_wiki_id.csv" $temp/WIKI_INFO/$id"_wiki_name.csv" $temp/WIKI_INFO/$id"_wiki_url.csv" $temp/WIKI_INFO/$id"_wiki_body.csv" > $file_no_ext_imdb"_WIKI.csv"
fi

# main button if trivia is empty
if [[ $(grep -L '<li class=\"list-group-item\">' $temp/CSV_FIELDS/$id"_trivia.csv") ]]
then
echo -e "${white}---> Trivia\t\t\t\t\t\t\t\t\t\t\t${orange}None"
printf 'trivia
' > $temp/CSV_FIELDS/$id"_trivia.csv"
else
echo -e "${white}---> Trivia\t\t\t\t\t\t\t\t\t\t\t${green}Contains information"
printf '<a class="btn btn-secondary" href="#trivia" type="button">Trivia</a>' >> $temp/HTML/$id"_Button_Main_button.txt"
fi

# main button if goofs is empty
if [[ $(grep -L "<li\ class\=\"list-group-item\">" $temp/CSV_FIELDS/$id"_goofs.csv") ]]; then
echo -e "${white}---> Goofs\t\t\t\t\t\t\t\t\t\t\t${orange}None"
printf 'goofs
' > $temp/CSV_FIELDS/$id"_goofs.csv"
else
echo -e "${white}---> Goofs\t\t\t\t\t\t\t\t\t\t\t${orange}None"
printf '<a class="btn btn-secondary" href="#goofs" type="button">Goofs</a>' >> $temp/HTML/$id"_Button_Main_button.txt"
fi


printf '<div aria-label="Basic main" class="btn-group" role="group">' > $temp/HTML/$id"_Button_Menu.txt"
cat $temp/HTML/$id"_Button_Main_button.txt" >> $temp/HTML/$id"_Button_Menu.txt"
echo "</div>" >> $temp/HTML/$id"_Button_Menu.txt"
tr '\n' ' ' < $temp/HTML/$id"_Button_Menu.txt" > $temp/CSV_FIELDS/$id"_Buttons_Menu.csv"
printf '%s\n' 0a 'menu' . x | ex $temp/CSV_FIELDS/$id"_Buttons_Menu.csv"

# main button and field locations, if location is empty
if [[ $(grep -L "<a\ class\=\"list-group-item" $temp/CSV_FIELDS/$id"_locations.csv") ]]; then
echo -e "---> Location\t\t\t\t\t\t\t\t\t\t\t${red}Not Found"
printf 'Location1
' > $temp/CSV_FIELDS/$id"_locations.csv"
sed -i '' 's/<a\ class=\"btn\ btn-secondary\"\ href=\"\#locations\"\ type=\"button\">Locations<\/a>//g' $temp/CSV_FIELDS/$id"_Buttons_Menu.csv"
fi


#
# 1 SERIE
#


cat tmp_bash | awk '!NF || !seen[$0]++' > tmp_bash1
mv tmp_bash1 tmp_bash
source tmp_bash

if [ "$SERIE" == "1" ]
then
echo -e "${white}---> _Buttons_Menu.csv\t\t\t\t\t\t\t\t\t\t${green}Is present"
paste "$temp"/CSV_FIELDS/"$id"_Buttons_Menu_Series.csv "$temp"/CSV_FIELDS/"$id"_Buttons_Menu.csv | awk 'NR==2' > ButtonsTmp.txt
printf 'menu
' > "$temp"/CSV_FIELDS/"$id"_Buttons_Menu.csv
cat ButtonsTmp.txt >> "$temp"/CSV_FIELDS/"$id"_Buttons_Menu.csv

# Assemblage des fields     #Si c'est une SERIES
paste -d'|' $temp/CSV_FIELDS/$id"_mp4.csv" $temp/CSV_FIELDS/$id"_titlefr.csv" $temp/CSV_FIELDS/$id"_title.csv" $temp/CSV_FIELDS/$id"_taglines.csv" $temp/CSV_FIELDS/$id"_Directors.csv" $temp/CSV_FIELDS/$id"_Writing_Credits.csv" $temp/CSV_FIELDS/$id"_year.csv" $temp/CSV_FIELDS/$id"_Genre.csv" $temp/CSV_FIELDS/$id"_machine_name.csv" $temp/CSV_FIELDS/$id"_id.csv" $temp/CSV_FIELDS/$id"_url.csv" $temp/CSV_FIELDS/$id"_country.csv" $temp/CSV_FIELDS/$id"_budget.csv" $temp/CSV_FIELDS/$id"_plot_synopsis.csv" $temp/CSV_FIELDS/$id"_poster.csv" $temp/CSV_FIELDS/$id"_runtime.csv" $temp/CSV_FIELDS/$id"_sound_system.csv" $temp/CSV_FIELDS/$id"_duration.csv" $temp/CSV_FIELDS/$id"_framerate.csv" $temp/CSV_FIELDS/$id"_vsize.csv" $temp/CSV_FIELDS/$id"_filesize.csv" $temp/CSV_FIELDS/$id"_full_cast.csv" $temp/CSV_FIELDS/$id"_DOP.csv" $temp/CSV_FIELDS/$id"_Music.csv" $temp/CSV_FIELDS/$id"_Editors.csv" $temp/CSV_FIELDS/$id"_company.csv" $temp/CSV_FIELDS/$id"_color.csv" $temp/CSV_FIELDS/$id"_aspectratio.csv" $temp/CSV_FIELDS/$id"_rating.csv" $temp/CSV_FIELDS/$id"_releasedate.csv" $temp/CSV_FIELDS/$id"_locations.csv" $temp/CSV_FIELDS/$id"_production_dates.csv" $temp/CSV_FIELDS/$id"_filming_dates.csv" $temp/CSV_FIELDS/$id"_stills.csv" $temp/CSV_FIELDS/$id"_shtg.csv" $temp/CSV_FIELDS/$id"_trailers.csv" $temp/CSV_FIELDS/$id"_mof.csv" $temp/CSV_FIELDS/$id"_aka.csv" $temp/CSV_FIELDS/$id"_crazy_credits.csv" $temp/CSV_FIELDS/$id"_goofs.csv" $temp/CSV_FIELDS/$id"_trivia.csv" $temp/CSV_FIELDS/$id"_Season.csv" $temp/CSV_FIELDS/$id"_Episode.csv" $temp/CSV_FIELDS/$id"_Poducer.csv" $temp/CSV_FIELDS/$id"_Buttons_Menu.csv" $temp/CSV_FIELDS/$id"_SetDesigner.csv" > $file_no_ext_imdb"_SERIE.csv"

LeDossierSource=$(echo "$temp"| sed 's/'"$id"_"$year"'_Fields//')
echo -e "${white}---> \$LeDossierSource\t\t\t\t\t\t\t\t\t\t${orange}$LeDossierSource"
echo -e "${white}---> 📺"\ "Post traitement de fin de de la serie\t\t\t\t\t\t\t${orange}$Tv_serie_title"
rsync -vrltDh --update --stats --human-readable "$LeDossierSource" ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year" | pv -lep -s 42 >/dev/null
rm -R ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_Fields/HTML/*

all_Series_csvs=$(
find ../_Output/_SERIES/"$Tv_serie_title" -name '*_SERIE.csv' -exec echo {} + | sed 's/\/\//\//g'
)
awk 'FNR==1 && NR!=1{next;}{print"\n"}' $all_Series_csvs > ../_Output/_SERIES/"$Tv_serie_title"/"$Tv_serie_title"_Serie_principale.csv

if [ -f ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_posters/"$SerieParentID"_A_poster.jpg ]
then
echo -e "${white}---> Main poster found in : \t\t\t\t\t\t\t\t\t${green}../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_posters/"$SerieParentID"_A_poster.jpg"
else
if [ -f ../0.jpg ]
then
echo "${green}---> ../0.jpg was found an will be used as maisn poster in :\t\t\t\t\t\t../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_posters/"$SerieParentID"_A_poster.jpg"
cp ../0.jpg ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_posters/"$SerieParentID"_A_poster.jpg
fi
fi

if [ -f ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_posters/"$SerieParentID"_A_poster.jpg ]
then
echo -e "${white}---> Génération du poster du dossier contenant la serie\t\t:\t\t\t\t${orange}../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"${green}"
convert ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_posters/"$SerieParentID"_A_poster.jpg -gravity center -background transparent -resize 512x512 -extent 512x512 servers/osxiconutils/tmp.png
./icon.sh servers/osxiconutils/tmp.png ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"


echo -e "${white}---> Génération du poster de la serie principal\t\t\t:\t\t\t\t${orange}../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_posters/"$SerieParentID"_A_poster.jpg${green}"
convert ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_posters/"$SerieParentID"_A_poster.jpg -gravity center -background transparent -resize 512x512 -extent 512x512 A.png
./icon.sh A.png ../_Output/_SERIES/"$Tv_serie_title"

rm *.png




fi


### ZIP
echo -e "${white}---> 🗜"\ " Create a zip archive whith /HTML/ + divers\t\t\t\t\t\t${orange}"$FileDate"_"$imdbID"_backup.zip"
mkdir -p "$temp"/ZIPS/

zip "$temp"/ZIPS/HTML_"$FileDate"_"$imdbID"_backup.zip "$file_no_ext_imdb".title.basic.txt "$file_no_ext_imdb"_Fields/HTML/"$id".html "$file_no_ext_imdb"_Fields/HTML/"$id"_wikipedia.html "$file_no_ext_imdb"_Fields/HTML/"$id"_Gallery.html "$file_no_ext_imdb"_Fields/HTML/"$id"_taglines.html "$file_no_ext_imdb"_Fields/HTML/"$id"_plotsummary.html "$file_no_ext_imdb"_Fields/HTML/"$id"_releaseinfo.html "$file_no_ext_imdb"_Fields/HTML/"$id"_locations.html "$file_no_ext_imdb"_Fields/HTML/"$id"_main.html "$file_no_ext_imdb"_Fields/HTML/"$id"_goofs.html "$file_no_ext_imdb"_Fields/HTML/"$id"_trivia.html "$file_no_ext_imdb"_posters/*.jpg "$file_no_ext_imdb"_source_imdb.txt "$file_no_ext_imdb"_Fields/HTML/"$id"_locations.html "$file_no_ext_imdb"_Fields/HTML/"$id"_episodes.html> /dev/null 2>&1
rm -R "$temp"/HTML/*

echo "${purple}---> Tv_serie_title $Tv_serie_title"
echo "${purple}---> seasonNbr $seasonNbr"
echo "${purple}---> LeNumeroDeLEpisode $LeNumeroDeLEpisode"
echo "${purple}---> id $id"
echo "${purple}---> year $year"
echo "${orange}../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_posters"
iconfolder=$(ls ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_posters/*.jpg|awk FNR==1)
echo -e "${white}---> Making folder's icon with osxiconutils\t\t\t\t\t\t\t${orange}$TheFilmFolder"
convert "$iconfolder" -gravity center -background transparent -resize 512x512 -extent 512x512  tmp.png
./icon.sh tmp.png ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"
else
##
#### Assemblage des fields     #Si ce n'est pas une SERIES
##
echo "${bg_green}${white}
---> Je ne suis pas une Serie <---
${reset}
"

MenuSerieAbsent="$temp"/CSV_FIELDS/"$id"_Season.csv
if test -f "$MenuSerieAbsent"; then
echo -e "${white}---> \$MenuSerieAbsent\t\t\t\t\t\t\t\t\t\t${green}Is already in place"
else
printf 'Season
' > "$temp"/CSV_FIELDS/"$id"_Season.csv
fi
#
EpisodeSerieAbsent="$temp"/CSV_FIELDS/"$id"_Episode.csv
if test -f "$EpisodeSerieAbsent"; then
echo -e "${white}---> \$EpisodeSerieAbsent\t\t\t\t\t\t\t\t\t${green}Is already in place"
else
printf 'Season
' > "$temp"/CSV_FIELDS/"$id"_Episode.csv
fi

paste -d'|' $temp/CSV_FIELDS/$id"_mp4.csv" $temp/CSV_FIELDS/$id"_titlefr.csv" $temp/CSV_FIELDS/$id"_title.csv" $temp/CSV_FIELDS/$id"_taglines.csv" $temp/CSV_FIELDS/$id"_Directors.csv" $temp/CSV_FIELDS/$id"_Writing_Credits.csv" $temp/CSV_FIELDS/$id"_year.csv" $temp/CSV_FIELDS/$id"_Genre.csv" $temp/CSV_FIELDS/$id"_machine_name.csv" $temp/CSV_FIELDS/$id"_id.csv" $temp/CSV_FIELDS/$id"_url.csv" $temp/CSV_FIELDS/$id"_country.csv" $temp/CSV_FIELDS/$id"_budget.csv" $temp/CSV_FIELDS/$id"_plot_synopsis.csv" $temp/CSV_FIELDS/$id"_poster.csv" $temp/CSV_FIELDS/$id"_runtime.csv" $temp/CSV_FIELDS/$id"_sound_system.csv" $temp/CSV_FIELDS/$id"_duration.csv" $temp/CSV_FIELDS/$id"_framerate.csv" $temp/CSV_FIELDS/$id"_vsize.csv" $temp/CSV_FIELDS/$id"_filesize.csv" $temp/CSV_FIELDS/$id"_full_cast.csv" $temp/CSV_FIELDS/$id"_DOP.csv" $temp/CSV_FIELDS/$id"_Music.csv" $temp/CSV_FIELDS/$id"_Editors.csv" $temp/CSV_FIELDS/$id"_company.csv" $temp/CSV_FIELDS/$id"_color.csv" $temp/CSV_FIELDS/$id"_aspectratio.csv" $temp/CSV_FIELDS/$id"_rating.csv" $temp/CSV_FIELDS/$id"_releasedate.csv" $temp/CSV_FIELDS/$id"_locations.csv" $temp/CSV_FIELDS/$id"_production_dates.csv" $temp/CSV_FIELDS/$id"_filming_dates.csv" $temp/CSV_FIELDS/$id"_stills.csv" $temp/CSV_FIELDS/$id"_shtg.csv" $temp/CSV_FIELDS/$id"_trailers.csv" $temp/CSV_FIELDS/$id"_mof.csv" $temp/CSV_FIELDS/$id"_aka.csv" $temp/CSV_FIELDS/$id"_crazy_credits.csv" $temp/CSV_FIELDS/$id"_goofs.csv" $temp/CSV_FIELDS/$id"_trivia.csv" $temp/CSV_FIELDS/$id"_Season.csv" $temp/CSV_FIELDS/$id"_Episode.csv" $temp/CSV_FIELDS/$id"_Poducer.csv" $temp/CSV_FIELDS/$id"_Buttons_Menu.csv" $temp/CSV_FIELDS/$id"_SetDesigner.csv" $temp/CSV_FIELDS/$id"_Makeup.csv" > $file_no_ext_imdb"_MOVIE.csv"


echo -e "${white}---> 🗜"\ " Create a zip archive whith /HTML/ for films\t\t\t\t\t\t\t\t${orange}"$FileDate"_"$imdbID"_backup.zip"
mkdir -p "$temp"/ZIPS/

zip "$temp"/ZIPS/HTML_"$FileDate"_"$imdbID"_backup.zip "$file_no_ext_imdb".title.basic.txt "$file_no_ext_imdb"_Fields/HTML/"$id".html "$file_no_ext_imdb"_Fields/HTML/"$id"_wikipedia.html "$file_no_ext_imdb"_Fields/HTML/"$id"_Gallery.html "$file_no_ext_imdb"_Fields/HTML/"$id"_taglines.html "$file_no_ext_imdb"_Fields/HTML/"$id"_plotsummary.html "$file_no_ext_imdb"_Fields/HTML/"$id"_releaseinfo.html "$file_no_ext_imdb"_Fields/HTML/"$id"_locations.html "$file_no_ext_imdb"_Fields/HTML/"$id"_main.html "$file_no_ext_imdb"_Fields/HTML/"$id"_goofs.html "$file_no_ext_imdb"_Fields/HTML/"$id"_trivia.html "$file_no_ext_imdb"_posters/*.jpg "$file_no_ext_imdb"_source_imdb.txt "$file_no_ext_imdb"_Fields/HTML/"$id"_locations.html > /dev/null 2>&1
python servers/finder_colors.py green "$temp"/ZIPS/HTML_"$FileDate"_"$imdbID"_backup.zip #&> /dev/nul
rm -R "$temp"/HTML/*

LeDossierSourcefilm=$(echo "$temp" | sed 's|\(.*\)/.*|\1|')

echo -e "${white}\$LeDossierSourcefilm\t\t\t\t\t\t\t${orange}$LeDossierSourcefilm"
iconfolderfilm=$(ls "$file_no_ext_imdb"_posters/*.jpg|awk FNR==1)
echo -e "${white}---> Making folder's icon with osxiconutils\t\t\t\t\t\t\t${orange}$LeDossierSourcefilm"
convert "$iconfolderfilm" -gravity center -background transparent -resize 512x512 -extent 512x512  tmp.png
./icon.sh tmp.png "$LeDossierSourcefilm"
echo "$red LeDossierSourcefilm $LeDossierSourcefilm"


# FIN SERIE YES/NOT
fi

echo "${green}---> DONE!${white}

---> NEXT?"



# DONE FINAL
done









#
#6
#



# ASSEMBLAGE FINAL



if [ "$SERIE" == "1" ]
then
# Assemblage du CSV pour l'import des series
AllSerieEncoded=$(find ../_Output/_SERIES/ -name *_SERIE.csv)
#Recherche des CSV dans :
printf "$AllSerieEncoded"  | sed 's/\/\///g' > ../_Output/_SERIES/list_des_films.txt
ListeDesSeries=$(cat ../_Output/_SERIES/list_des_films.txt)
# Supression du csv avant generation par addition
#if [ -f "$FileDone"/_FILM_IMPORT.csv ]
#then
#rm "$FileDone"/_FILM_IMPORT.csv
#fi
# Generation du csv à partir de la ligne 2 - awk FNR==2 etc...
for lefilm in $ListeDesSeries
do
awk FNR==2 "$lefilm" >> ../_Output/_SERIES/_SERIE_IMPORT.csv
done
# Récuperation du header
awk FNR==1 "$lefilm" > "$FileDone"/AllSERIEStemp.csv
# Print des info csv de chaque film
cat "$FileDone"/_SERIE_IMPORT.csv >> "$FileDone"/AllSERIEStemp.csv
# Supression des lignes vides
awk 'NF > 0' "$FileDone"/AllSERIEStemp.csv > "$FileDone"/_FILM_IMPORT.csv
# Supression du temporaire
rm "$FileDone"/AllSERIEStemp.csv ../_Output/list_des_films.txt

nbrdefilm=$(wc -l "$FileDone"/_FILM_IMPORT.csv | tr -d ' ' | sed -e 's/_FILM_IMPORT.csv//g'| awk -F'\.\.' '{print $1}')
nbrdefilmmoinsun=$(echo "$nbrdefilm"-1| bc -l)
echo "$nbrdefilm"
TheMasterFilmFolder=$(echo "$TheFilmFolder" | sed 's|\(.*\)/.*|\1|'| sed 's/\/\//\//g')
echo "${purple}TheMasterFilmFolder $TheMasterFilmFolder"
echo -e "${white}---> Il y a ${orange}$nbrdefilmmoinsun${white} film(s) dans le dossier : \t\t\t\t\t\t\t${orange}../_Output/${reset}"

else
# Assemblage du CSV pour l'import des films
AllFilmEncoded=$(find "$FileDone"/ -name *_MOVIE.csv)
#Recherche des CSV dans :
printf "$AllFilmEncoded"  | sed 's/\/\///g' > "$FileDone"_list_des_films.txt
ListeDesFilms=$(cat "$FileDone"_list_des_films.txt)
# Supression du csv avant generation par addition
if [ -f "$FileDone"_FILM_IMPORT.csv ]
then
rm "$FileDone"_FILM_IMPORT.csv
fi
# Generation du csv à partir de la ligne 2 - awk FNR==2 etc...
for lefilm in $ListeDesFilms
do
awk FNR==2 "$lefilm" >> "$FileDone"/_FILM_IMPORT.csv
done
# Récuperation du header
awk FNR==1 "$lefilm" > "$FileDone"AllFilmstemp.csv
# Print des info csv de chaque film
cat "$FileDone"/_FILM_IMPORT.csv >> "$FileDone"/AllFilmstemp.csv
# Supression des lignes vides
awk 'NF > 0' "$FileDone"/AllFilmstemp.csv > "$FileDone"/_FILM_IMPORT.csv
# Supression du temporaire
rm "$FileDone"/AllFilmstemp.csv "$FileDone"/_list_des_films.txt

nbrdefilm=$(wc -l "$FileDone"/_FILM_IMPORT.csv | tr -d ' ' | sed -e 's/_FILM_IMPORT.csv//g'| awk -F'\.\.' '{print $1}')
nbrdefilmmoinsun=$(echo "$nbrdefilm"-1| bc -l)
echo "$nbrdefilm"
TheMasterFilmFolder=$(echo "$TheFilmFolder" | sed 's|\(.*\)/.*|\1|'| sed 's/\/\//\//g')
echo "${purple}TheMasterFilmFolder $TheMasterFilmFolder"
echo -e "${white}---> Il y a ${orange}$nbrdefilmmoinsun${white} film(s) dans le dossier : \t\t\t\t\t\t\t${orange}../_Output/${reset}"
fi

















# Assemble People
all_people_csvs=$(
find "$FileDone" -name '*people.csv' -exec echo {} +
)
awk -F'\|' 'FNR==0 && NR!=0{next;}{print}' $all_people_csvs > _Taxonomy_people_source.csv
awk -F'\|' '/^[[:blank:]]*$/ { print; next; }; !seen[$1]++' _Taxonomy_people_source.csv | awk '!seen[$1]++' | awk -F'|' '{print $1, $2, $3}' OFS='|' > _Taxonomy_people.csv
sed -i.bak "1 s/^.*$/people_id|people_url|people_name/" _Taxonomy_people.csv
rm _Taxonomy_people.csv.bak _Taxonomy_people_source.csv

awk -F'\|' 'FNR==NR{a[$1];next};!($1 in a)' GUID.csv _Taxonomy_people.csv > _TAXONOMY_PEOPLE_DIFF_TO_IMPPORT_tmp.csv
awk -F'\|' '!/people_id/' _TAXONOMY_PEOPLE_DIFF_TO_IMPPORT_tmp.csv > _TAXONOMY_PEOPLE_DIFF_TO_IMPPORT.csv
sed -i.bak "1 s/^.*$/people_id|people_url|people_name/" _TAXONOMY_PEOPLE_DIFF_TO_IMPPORT.csv
awk -F'\|' '{print $1, $2, $3}' OFS='|' _TAXONOMY_PEOPLE_DIFF_TO_IMPPORT.csv > _OK.txt
mv _OK.txt _TAXONOMY_PEOPLE_DIFF_TO_IMPPORT.csv

rm _TAXONOMY_PEOPLE_DIFF_TO_IMPPORT.csv.bak _TAXONOMY_PEOPLE_DIFF_TO_IMPPORT_tmp.csv
#mv _TAXONOMY_PEOPLE_DIFF_TO_IMPPORT.csv ../_Output/_Taxonomy_people2IMPORT.csv
fi

#
# DONE FINAL
#
done

#
#if [ -f "${purple}$file"#DONE ]
#then
#echo "${red} file $FileDone"
#fi
#

cd - &>/dev/null
