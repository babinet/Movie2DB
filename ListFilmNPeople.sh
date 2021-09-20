#!/bin/bash
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
cd $dir &>/dev/null
orange=`tput setaf 11`
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
echo "${bg_blue}${white}JE SUIS ListFilmNPeople.sh ${reset}"

for FileDone in ../_Output/*/
do
if [ -f "$FileDone"/#DONE ]
then
echo -e "${white}---> $FileDone contains ${red}#Done\t\t\t\t\t\t\t\t${red}lockfile"
echo "${white}---> $FileDone will be ignored"
else
echo -e "${green}---> To do : ${white}"

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
awk FNR==2 "$lefilm" >> "$FileDone"_FILM_IMPORT.csv
done
# Récuperation du header
awk FNR==1 "$lefilm" > "$FileDone"AllFilmstemp.csv
# Print des info csv de chaque film
cat "$FileDone"/_FILM_IMPORT.csv >> "$FileDone"AllFilmstemp.csv
# Supression des lignes vides
awk 'NF > 0' "$FileDone"AllFilmstemp.csv > "$FileDone"_FILM_IMPORT.csv
# Supression du temporaire
rm "$FileDone"AllFilmstemp.csv "$FileDone"_list_des_films.txt

nbrdefilm=$(wc -l "$FileDone"_FILM_IMPORT.csv | tr -d ' ' | sed -e 's/_FILM_IMPORT.csv//g')
echo -e "${white}Il y a ${orange}$nbrdefilm${white} films dans le dossier : \t\t\t\t\t\t\t${orange}../_Output/${reset}"




# Assemble People
echo -e "${white}---> Assembling People for taxonomy\t\t\t\t\t\t\t\t\t${orange}../_Output/_Taxonomy_people2IMPORT.csv"
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

mv _TAXONOMY_PEOPLE_DIFF_TO_IMPPORT.csv ../_Output/_Taxonomy_people2IMPORT.csv

fi


done

