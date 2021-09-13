#/bin/bash!
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
cd $dir &>/dev/null
cat tmp_bash | awk '!NF || !seen[$0]++' > tmp_bash1
mv tmp_bash1 tmp_bash
source tmp_bash
echo "${bg_blue}${white}---> JE SUIS Episodes.sh ${reset}"
echo -e "${white}---> Reference ID for the serie\t\t\t\t\t\t\t\t\t${orange}$id"

echo -e "${white}---> \$file_no_ext_imdb\t\t\t\t\t\t\t\t\t\t${orange}$file_no_ext_imdb"
echo -e "${white}---> \$temp\t\t\t\t\t\t\t\t\t\t\t${orange}$temp"
#echo "$title"  > temp.txt
echo -e "${white}---> \$name_no_space\t\t\t\t\t\t\t\t\t\t${orange}$name_no_space"

#class Saison
tvepisode=$(echo   ''\"'@type'\"': '\"'TVEpisode'\"','
)
echo "${white}---> Checking type $tvepisode"
if [[ $tvepisode == *''\"'@type'\"': '\"'TVEpisode'\"','* ]]; then
echo -e "${white}---> TVEpisode\t\t\t\t\t\t\t\t\t\t\t${green}Detected${reset}"
echo "${bg_green}${white}
####################################################################################################################
---> Telechargement conditionel du fichiers des episodes de la saison
####################################################################################################################${reset}"
count=`ls -1 "$temp"/HTML/"$imdbID"_fullcredits 2>/dev/null | wc -l`
if [ $count != 0 ]
then
echo -e "${white}---> ✅"\ "${green}Was found\t\t\t\t\t\t\t\t\t\t${orange}"📝\ ../_Output/_Serie2Process/"$id"_"$year"/"$id"_"$year"_Fields/HTML/"$id"_fullcredits.html
else
echo "${bg_orange}${white}
####################################################################################################################
---> File not found downloading with wget 📝"\ ""$imdbID"_fullcredits.html
####################################################################################################################${reset}"
echo -e "${white}---> Rapatriement du fullcredit imdb dans\t\t\t\t\t\t\t${orange}$temp\HTML${green}"
wget -O "$id"_"$Year"_Fields/HTML/"$id"_fullcredits.html https://www.imdb.com/title/"$id"/fullcredits
fi
# TriX
# open -a /Applications/Stuffit\ Expander.app /path/to/the/file.sit
# rend invisible: setfile -a V ../dossier\ sans\ titr
# rend visible: setfile -a v ../dossier\ sans\ titr

# Selection de la derniere section apres le slash 's:.*/::'

# Conditions
# Le dossier doit être placé dans ../_OUtput/_Serie2Process/

# si le dossier n'est pas à sa place finale le déplacer dans la serie source ../_Output/[SerieParent]/les dossier du film.
# Si le parent a déja été processé utiliser l'archive la plus récente
# Si le parent n'a pas déja été processé download with wget + poster

# Si le film n'est pas là, rendre inactif le lien
# Déplacer le tout dans la destionation
## Tagger avec un fichier #Done les série déja processer sinon procedurea avec process en place
# Liste des fichiers parents > CSV.csv parents à importer

# Lister les film déja présents. si doubles, ouvrir le dossier déplacer le dossier du doupble info size+size image du film dans le dossier double avec date pour nom

##
# Si le HTML du parent a déja été rapatrié📝tmp_bash
##
mainfilehtml="$temp"/HTML/"$id"_main.html
if test -f "$mainfilehtml"; then
echo -e "${white}---> ✅"\ "${green}Was found\t\t\t\t\t\\t\t\t\t\t${orange}📝$temp/HTML/$id"_main.html""
else
echo "---> Rapatriement de la page principale "$id"$temp/HTML/$id"_main.html""
wget -O "$temp"/HTML/"$id"_main.html https://www.imdb.com/title/"$id"
fi

#
## Fin du chack DL HTML
#

#
# Season
awk '/<div\ class=\"bp_heading\">Season\ /,/<\/div>/' $temp/HTML/$id"_main.html" | sed -e "s/<div\ class=\"bp_heading\">Season\ //g" | sed -e 's/^[ \t]*//' | awk -F'\ <span' '{print $1}' > $temp/CSV_FIELDS/$id"_Season.csv"
printf '%s\n' 0a 'Season' . x | ex "$temp"/CSV_FIELDS/"$id"_Season.csv

seasonNbr=$(
awk '/<div\ class=\"bp_heading\">Season\ /,/<\/div>/' "$temp"/HTML/"$id"_main.html | sed -e "s/<div\ class=\"bp_heading\">Season\ //g" | sed -e 's/^[ \t]*//' | awk -F'\ <span' '{print $1}'
)
echo -e "${white}---> \$seasonNbr\t\t\t\t\t\t\\t\t\t\t\t${orange}$seasonNbr"


awk '/<div\ class=\"bp_heading\">Season\ /,/<\/div>/' "$temp"/HTML/"$id"_main.html | awk -F'Episode\ ' '{print $2}' | awk -F'<\/div>' '{print $1}' > "$temp"/CSV_FIELDS/"$id"_Episode.csv
printf '%s\n' 0a 'Episode' . x | ex "$temp"/CSV_FIELDS/"$id"_Episode.csv

episodeNumber=$(
awk '/episodeNumber/{print $NF}' "$temp"/HTML/"$id"_main.html | awk -F'content\=\"' '{print $2}' | awk -F'\"\/>' '{print $1}'
)

LeNumeroDeLEpisode=$(
cat "$temp"/CSV_FIELDS/"$id"_Episode.csv | sed '1d'
)

echo -e "${white}---> \$LeNumeroDeLEpisode\t\t\t\t\t\t\t\t\t${orange}$LeNumeroDeLEpisode${reset}"
echo "LeNumeroDeLEpisode="\"$LeNumeroDeLEpisode\"" >> tmp_bash
#
#Tv_serie_title.csv
awk '/<div class="titleParent">/,/<\/div>/' $temp"/HTML/"$id"_main.html" | awk '/title='\"'/,/'\"'\ >/' | awk -F'title=\"' '{print $2}' | awk -F'\" >' '{print $1}' > $temp/CSV_FIELDS/$id"_Tv_serie_title.csv"
printf '%s\n' 0a 'Tv_serie_title' . x | ex $temp/CSV_FIELDS/$id"_Tv_serie_title.csv"

#
#<div class="titleParent"> ref vers la serie
awk '/<div\ class\=\"titleParent\">/,/title=\"/' "$temp"/HTML/"$id"_main.html" | awk -F'<a href=\"' '{print $2}' | awk -F'\"' '{print $1}' > "$temp"/CSV_FIELDS/"$id"_serie_parent.csv
printf '%s\n' 0a 'serie_parent' . x | ex "$temp"/CSV_FIELDS/"$id"_serie_parent.csv

#
#address parent
awk '/<div\ class\=\"titleParent\">/,/title=\"/' "$temp"/HTML/"$id"_main.html | awk -F'<a href=\"' '{print $2}' | awk -F'\" >' '{print $1}' | awk 'NF > 0' | tr -d '"' > "$temp"/CSV_FIELDS/"$id"_address_serie_parent.csv
printf '%s\n' 0a 'adress_serie_parent' . x | ex "$temp"/CSV_FIELDS/"$id"_address_serie_parent.csv

address_serie_parent=$(
awk '{if (NR!=1) {print}}' "$temp"/CSV_FIELDS/"$id"_address_serie_parent.csv
)

echo -e "${white}---> Ajout de la variable \$seasonNb${orange}${white} ($seasonNbr) dans :\t\t\t\t\t\t\t${orange}tmp_bash"
#
# Epsiode
if [ -f "$temp"/HTML/"$id"_episodes.html ]
then
echo -e "${white}---> ${green}✅"\ "Was found${white}\t\t\t\t\t\t\t\t\t\t${orange}📝"$temp"/HTML/"$id"_episodes.html"
else
echo -e "${white}---> Rapatriement de la page principale des episodes de la saison\t\t\t\t\t${orange}"$seasonNbr""
wget -O $temp/HTML/$id"_episodes.html" "https://www.imdb.com"$address_serie_parent"/episodes?season="$seasonNbr""
fi

echo "seasonNbr="\""$seasonNbr"\""" >> tmp_bash



Tv_serie_title=$(
awk '{if (NR!=1) {print}}' $temp/CSV_FIELDS/"$id"_Tv_serie_title.csv
)

echo "Tv_serie_title="\""$Tv_serie_title"\"""  >> tmp_bash
SerieParentID=$(
awk '/<div\ class\=\"titleParent\">/,/title=\"/' $temp/HTML/$id"_main.html" | awk -F'<a href=\"' '{print $2}' | awk -F'\" >' '{print $1}' | awk 'NF > 0' | tr -d '"' |awk -F'/' '{print $3}'
)

echo -e "${white}---> \$Tv_serie_title\t\t\t\t\t\t\t\t\t\t${orange}$Tv_serie_title"
echo -e "${white}---> \$SerieParentID\t\t\t\t\t\t\t\t\t\t${orange}$SerieParentID"

#
#
#Number of episodes
numberofEpisodes=$(
awk '/numberofEpisodes/{print $NF}' $temp/HTML/$id"_episodes.html" | awk -F'content\=\"' '{print $2}' | awk -F'"/>' '{print $1}'
)
echo -e "${white}---> \$numberofEpisodes\t\t\t\t\t\t\t\t\t\t${orange}$numberofEpisodes"
awk '/episodeNumber/,/<\/a><\/strong>/' $temp/HTML/$id"_episodes.html" > episode.txt
tr '\n' ' ' < episode.txt | sed -e 's/episodeNumber/\
episodeNumber/g' | awk '/episodeNumber/' >  episodes.txt

# Creation des menu épisodes et des liens pour chaque film...
# + Retour au film parent

echo '<div class="btn-toolbar">
<div class="btn-group">' > epsiodes_links.txt
echo -e "${white}---> Overture des tags pour le menu de navigation\t\t\t\t\t\t${orange}<div class="\""btn-toolbar"\"">"

echo '<a class="btn btn-default" data-toggle="tooltip" data-placement="top" title="'$EpTitle'" href="'$SerieParentID'">'$Tv_serie_title'</a>' >> epsiodes_links.txt

while read line
do
# variable épisode N° EpNbr
EpNbr=$(
echo $line | awk -F'episodeNumber\"\ content\=\"' '{print $2}' | awk -F'\"\/>' '{print $1}'
)
# variable épisode Link Eplink
Eplink=$(
echo $line | awk -F'<strong><a href\=\"' '{print $2}' | awk -F'\"' '{print $1}'
)
# variable épisode Title EpTitle
EpTitle=$(
echo $line | awk -F'itemprop=\"name\">' '{print $2}' | awk -F'<\/a><\/strong>' '{print $1}'
)
# variable épisode Link targetedID
targetedID=$(
echo $line | awk -F'/title/' '{print $2}' | awk -F'/' '{print $1}'
)

##echo "Tv_serie_title $Tv_serie_title"
#parent_title_basic="$Tv_serie_title"/00_"$SerieParentID"_"$year"/
#if test -f "$parent_title_basic"; then
#echo -e "${white}---> $parent_title_basic\t\t\t\t\t${white}$parent_title_basic"
#else
#echo "${white}---> Le Dosier Parent $parent_title_basic does not exist. Let"\'"s create it..."
#echo -e "${white}---> \$Tv_serie_title\t\t\t\t\t\t\t\t\t\t${orange}../_Output/_SERIES/$Tv_serie_title${reset}"
#
#echo -e "${white}---> \$seasonNbr\t\t:\t\t\t\t\t\t\t\t\t${orange}$seasonNbr"
#echo -e "${white}---> \$EpNbr\t\t:\t\t\t\t\t\t\t\t\t${orange}$EpNbr"
#echo -e "${white}---> \$Eplink\t\t:\t\t\t\t\t\t\t\t\t${orange}$Eplink"
#echo -e "${white}---> \$targetedID\t:\t\t\t\t\t\t\t\t\t${orange}$targetedID"
#
#mkdir -p ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$EpNbr"_"$targetedID"_"$year"/"$targetedID"_"$year"_mof ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$EpNbr"_"$targetedID"_"$year"/"$targetedID"_"$year"_posters ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$EpNbr"_"$targetedID"_"$year"/"$targetedID"_"$year"_shtg ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$EpNbr"_"$targetedID"_"$year"/"$targetedID"_"$year"_stills ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$EpNbr"_"$targetedID"_"$year"/"$targetedID"_"$year"_Fields ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$EpNbr"_"$targetedID"_"$year"/"$targetedID"_"$year"_trailers
#
#mkdir -p ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_"$year"_mof ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_posters ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_shtg ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_stills ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_Fields ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_trailers
#echo "$SerieParentID|tvEpisode|$Tv_serie_title|$Tv_serie_title|0|$year|\N|52" > ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID".title.basic.txt
#
#fi

echo "Eplink $Eplink" | awk -F'/' '{print $3}' | tr '\n' '@' >> Eplink.txt

if echo $Eplink | awk -F'/' '{print $3}' | grep -q "$id"
then


echo -e "${white}---> Class Bootstrap\t\t\t\t\t\t\t\t\t\t${bg_orange}warning${reset}"


echo '<a class="btn btn-warning" data-toggle="tooltip" data-placement="top" title="'$EpTitle'" href="'$Eplink'">'$EpNbr'</a>' >> epsiodes_links.txt
else
echo '<a class="btn btn-default" data-toggle="tooltip" data-placement="top" title="'$EpTitle'" href="'$Eplink'">'$EpNbr'</a>' >> epsiodes_links.txt
fi
done < episodes.txt

parent_title_basic="$Tv_serie_title"/00_"$SerieParentID"_"$year"/
if test -f "$parent_title_basic"; then
echo -e "${white}---> $parent_title_basic\t\t\t\t\t${white}$parent_title_basic"
else
echo "${white}---> Le Dosier Parent $parent_title_basic does not exist. Let"\'"s create it..."

echo -e "${white}---> \$seasonNbr\t\t:\t\t\t\t\t\t\t\t\t${orange}$seasonNbr"
echo -e "${white}---> \$EpNbr\t\t:\t\t\t\t\t\t\t\t\t${orange}$EpNbr"
echo -e "${white}---> \$Eplink\t\t:\t\t\t\t\t\t\t\t\t${orange}$Eplink"
echo -e "${white}---> \$targetedID\t:\t\t\t\t\t\t\t\t\t${orange}$targetedID"

mkdir -p ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_mof ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_posters ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_shtg ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_stills ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_Fields ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_trailers

mkdir -p ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_"$year"_mof ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_posters ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_shtg .../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_stills ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_Fields ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_trailers
echo "$SerieParentID|tvEpisode|$Tv_serie_title|$Tv_serie_title|0|$year|\N|52" > ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID".title.basic.txt

fi

parent_title_basic="$Tv_serie_title"/00_"$SerieParentID"_"$year"/
if test -f "$parent_title_basic"; then
echo -e "${white}---> $parent_title_basic\t\t\t\t\t${white}$parent_title_basic"
else
echo "${white}---> Le Dosier Parent $parent_title_basic does not exist. Let"\'"s create it..."

echo -e "${white}---> \$seasonNbr\t\t:\t\t\t\t\t\t\t\t\t${orange}$seasonNbr"
echo -e "${white}---> \$EpNbr\t\t:\t\t\t\t\t\t\t\t\t${orange}$EpNbr"
echo -e "${white}---> \$Eplink\t\t:\t\t\t\t\t\t\t\t\t${orange}$Eplink"
echo -e "${white}---> \$targetedID\t:\t\t\t\t\t\t\t\t\t${orange}$targetedID"

mkdir -p ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_mof ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_posters ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_shtg ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_stills ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_Fields ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_trailers

mkdir -p ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_"$year"_mof ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_posters ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_shtg ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_stills ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_Fields ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_trailers
echo "$SerieParentID|tvEpisode|$Tv_serie_title|$Tv_serie_title|0|$year|\N|52" > ../_Output/_SERIES/"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID".title.basic.txt

fi


#if [ "$seasonNbr" == 0 ]
#then
#fi


#Changer de poster en plaçant un fichier .jpg du numéro de la serie soit seri 2 fichier 2.jpg
if [ -f ../"$seasonNbr".jpg ]
then
echo -e "${green}---> ✅"\ "Poster was found\t\t\t\t\t\t\t\t\t${orange}../"$seasonNbr".jpg"
fi

SerialPosterSource="../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_posters/"$id"_"$year"_A_poster.jpg"
SerialPoster=$(exiftool "$SerialPosterSource")
#exiftool "$SerialPosterSource"
echo "$purple  SerialPosterSource $SerialPosterSource"
#exiftool "$SerialPosterSource"
WidthImage=$(echo $SerialPoster | awk -F'Image Width : ' '{print $2}' | awk '{print $1}')
HeightImage=$(echo $SerialPoster | awk -F'Image Height : ' '{print $2}' | awk '{print $1}')

echo -e "${white}---> The width of the poster\t ${orange}\$WidthImage${white} is\t\t:\t\t\t\t\t${orange}"$WidthImage"px"
echo -e "${white}---> The height of the poster\t ${orange}\$HeightImage${white} is\t:\t\t\t\t\t${orange}"$HeightImage"px"

SaisonpositionX=$( echo $WidthImage/13 | bc -l | awk -F'.' '{print $1}')
EpisodepositionX=$( echo $WidthImage/13 | bc -l | awk -F'.' '{print $1}')
AllY=$(echo $HeightImage-$HeightImage/5 | bc -l  | awk -F'.' '{print $1}')
FontSise=$(echo $HeightImage/7 | bc -l | awk -F'.' '{print $1}')
StrokeWidth=$(echo $WidthImage/170 | bc -l | awk -F'.' '{print $1}')
# Posters Saisons
echo -e "${white}---> Traitement du poster\t\t\t\t\t\t\t\t\t${orange}Saison : "$seasonNbr" Episode : "$LeNumeroDeLEpisode""
convert -pointsize $FontSise -gravity NorthWest -font "/Library/Fonts/Roboto-Black.ttf" -fill "#B22222" -stroke "#D9D9D9" -strokewidth $StrokeWidth -draw ' text '"$SaisonpositionX"','"$AllY"' 'S"$seasonNbr"' ' "$SerialPosterSource"  outtmp.jpg
echo "${purple}$StrokeWidth StrokeWidth"
convert -pointsize $FontSise -gravity NorthEast -font "/Library/Fonts/Roboto-Black.ttf" -fill "#B22222" -stroke "#D9D9D9" -strokewidth $StrokeWidth -draw ' text '"$EpisodepositionX"','"$AllY"' '"E$LeNumeroDeLEpisode"' '  outtmp.jpg  o.jpg
sudo mv o.jpg ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$LeNumeroDeLEpisode"_"$id"_"$year"/"$id"_"$year"_posters/"$id"_"$year"_A_poster.jpg
#../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_"EP"_"$LeNumeroDeLEpisode"_"$id"/"$SerieParentID"_posters/"$id"_"$year"_A_poster.jpg"
rm *.jpg
#echo -e "${white}---> Copy de "$id"_episodes.html dans\t\t\t\t\t\t\t${orange}"$EpNbr"_"$targetedID"_"$year"/"$id"_"Year"/"$id"_"Year"_Fields/HTML"
##cp "$temp"/HTML/"$imdbID"_episodes.html ../_Output/_SERIES/"$Tv_serie_title"/"$seasonNbr"_EP_"$EpNbr"_"$targetedID"_"$year"/"$targetedID"_"$year"_Fields/
















echo '</div></div>' >> epsiodes_links.txt
printf 'SaisonEp
' > "$temp"/CSV_FIELDS/"$id"_Buttons_Menu_Series.csv

cat epsiodes_links.txt | tr '\n' ' ' >> "$temp"/CSV_FIELDS/"$id"_Buttons_Menu_Series.csv


echo "SerieParentID="$SerieParentID"" >> tmp_bash
echo "temp="$temp"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' | sed -e 's/\/\//\//g' >> "$dir"/tmp_bash
echo "name_no_space="$name_no_space"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
echo "year="$year"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
echo "title="$title"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
#echo "mp4="$mp4"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' | sed -e 's/\/\//\//g' >> "$dir"/tmp_bash
echo "imdbID="$id"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
echo "id="$id"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
#echo "file_no_ext_imdb="$file_no_ext_imdb"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' | sed -e 's/\/\//\//g' >> "$dir"/tmp_bash
#echo "TheFilmFolder="$TheFilmFolder"" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
echo "SERIE=1" | awk -F'=' '{print $1, "\""$2"\""}' OFS='=' >> "$dir"/tmp_bash
cat tmp_bash | awk '!NF || !seen[$0]++' > tmp_bash1
mv tmp_bash1 tmp_bash

#"$Tv_serie_title"/00_"$SerieParentID"/"$SerieParentID"_"$year"_mof

#prout=$(ls | tr '\n' '@')
#ou encore
#find . -name *_A_poster* | awk -F'/' '{print $4}' | tr '\n' '@'



## Fin du menu Nav
#
##00_"$Serie_Parents"/_Children.csv
##
#mv *.txt "$Tv_serie_title"/_Serie_Parents_"$SerieParentID"_"$year"/temp/
#mv *.html "$Tv_serie_title"/_Serie_Parents_"$SerieParentID"_"$year"/temp/
#
#echo "$SerieParentID|TV Episode|$Tv_serie_title|$Tv_serie_title|0|$year|0|" > "$Tv_serie_title"/_Serie_Parents_"$SerieParentID"_"$year"/"$SerieParentID"_"$year".title.basic.txt
#echo 'SerieParentID="$SerieParentID"' >> tmp_bash

#
#
#echo "episode Number $episodeNumber"
#
#
#
#echo "episodeNumber $episodeNumber"
#echo "numberofEpisodes $numberofEpisodes"
#echo "id $id"
#echo "temp $temp"
#echo "serie parent $address_serie_parent"
#echo "serie title $Tv_serie_title"
#
#
#
#
#
#echo '<h3><a class="btn btn-default" href="'"$address_serie_parent"'"\>Serie '"$Tv_serie_title"'</a></h3>' > "$Tv_serie_title/_Serie_Parents_$SerieParentID"_"$year"/temp/temp1.html
#
#




fi
cd -
