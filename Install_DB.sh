#!/bin/bash
echo "Je Suis Install_DB.sh"

# Mise a jour auto de la DB from IMDB
# définition des couleurs
red=`tput setaf 1`
bluelight=`tput setaf 6`
White=`tput setaf 7`
reset=`tput sgr0`

echo ${White}"
##########################################################################################
                                      Last Update
##########################################################################################"

if [[ -f Cleaned_DB/title.basics_movie.csv ]]
then
date -r Cleaned_DB/title.basics_movie.csv | awk '{print "Last update\ "$0}'
wc -l Cleaned_DB/title.basics_movie.csv | awk '{print "Nombre de lignes :"$0}'
du -m Cleaned_DB/title.basics_movie.csv | awk '{print "Taille en MO :"$0}'
else
echo "${white}---> There is no database"
mkdir -p Cleaned_DB
fi

read -r -p "${red}##########################################################################################

${reset}${White}Do you want to download a new dataset from IMDB and regenerate a New DB from last update ?

                   It will remove old Cleaned_db/ title.basic.csv
${red}
##########################################################################################${reset}${red}
[Y${reset}/n] " input
case $input in
[yY][eE][sS]|[yY])

Cleaned_is_here="Cleaned_db/"
if [ -d "$Cleaned_is_here" ]; then
echo "--> removing Cleaned_db/"
sudo rm -R Cleaned_db/
mkdir Cleaned_db
fi

echo "--> Downloading title.basics.tsv.gz on datasets.imdbws.com"
wget -O Cleaned_db/title.basics.tsv.gz https://datasets.imdbws.com/title.basics.tsv.gz
echo "--> Decompacting GunZip title.basics.tsv.gz"
gzip -dk Cleaned_db/title.basics.tsv.gz


#echo "--> Converting to CSV ..."
#tr '\t' '|' < Cleaned_db/title.basics.tsv >  Cleaned_db/title.basics_movie.csv
#awk 'BEGIN { OFS=FS="|" } $2 !~ /videoGame/' Cleaned_db/title.basics_movie.csv > Cleaned_db/tmp1.csv
#awk 'BEGIN { OFS=FS="|" } $2 !~ /Game-Show/' Cleaned_db/tmp1.csv > Cleaned_db/tmp2.csv
#awk 'BEGIN { OFS=FS="|" } $2 !~ /Reality-TV/' Cleaned_db/tmp2.csv > Cleaned_db/tmp3.csv
#awk 'BEGIN { OFS=FS="|" } $2 !~ /Video Games/' Cleaned_db/title.basics_movie.csv

echo "--> Converting to CSV ..."
tr '\t' '|' < Cleaned_db/title.basics.tsv | awk 'BEGIN { OFS=FS="|" } $2 !~ /videoGame/' > Cleaned_db/title.basics_movie_FAT.csv
echo "${white} Supression des rubriques Game-Show, videoGame, Video Games et Reality-TV print de \$1 \$2 \$3 \$4 \$5 \$6"
awk 'BEGIN { OFS=FS="|" } $2 !~ /Game-Show/' Cleaned_db/title.basics_movie_FAT.csv OFS='|' | awk 'BEGIN { OFS=FS="|" } $2 !~ /Reality-TV/' OFS='|' |
awk 'BEGIN { OFS=FS="|" } $2 !~ /Video Games/' OFS='|' | awk -F'|' '{print $1, $2, $3, $4, $5, $6}' OFS='|' > Cleaned_db/title.basics_movie.csv



echo "${red}#################################################
#                                               #
# ${White}La base est maintenant prète à être utilisée ${reset} #
#                                               #
#################################################
${reset}"


;;
[nN][oO]|[nN])
echo "No"
;;
*)
echo "Invalid option !!"
exit 1
;;
esac
