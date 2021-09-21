echo "JE SUIS ListFilmNPeople.sh"
id=$(echo tt1796960)
temp=$(echo tt1796960/tt1796960_temp/)

#https://www.imdb.com/title/tt1796960/episodes?season=2

echo $id
echo $temp



#Season Episode
echo "---> Season Episode"
awk '/<div class\=\"bp_heading\">Season/,/<\/div>/' $temp/html_fields/$id"_main.html" > $temp/html_fields/$id"_Season_Ep.txt"
echo "---> Text cleaning Season Episode"
#cat $temp/html_fields/$id"_Season_Ep.txt" | awk '{gsub(/<div\ class\=\"bp_heading\">/,"",$0)}1' > $temp/html_fields/$id"_Season_Ep_00.txt"
#cat $temp/html_fields/$id"_Season_Ep_00.txt" | awk '{gsub(/\ <span\ class\=\"ghost\">\|<\/span>| /,"|",$0)}1' > $temp/html_fields/$id"_Season_Ep_01.txt"
#cat $temp/html_fields/$id"_Season_Ep_01.txt" | awk '{gsub(/\|\|\|\|\|\|\|\|\|\|\|\|\|\|\|\|/,"",$0)}1' > $temp/html_fields/$id"_Season_Ep_02.txt"
#cat $temp/html_fields/$id"_Season_Ep_02.txt" | awk '{gsub(/\|\|/,"\t",$0)}1' > $temp/html_fields/$id"_Season_Ep_03.txt"
#cat $temp/html_fields/$id"_Season_Ep_03.txt" | awk '{gsub(/\|/,"\ ",$0)}1' > $temp/html_fields/$id"_Season_Ep_04.txt"
#cat $temp/html_fields/$id"_Season_Ep_04.txt" | awk '{gsub(/<\/div>/,"",$0)}1' > $temp/html_fields/$id"_Season_Ep_05.txt"
#cat $temp/html_fields/$id"_Season_Ep_05.txt" | awk '{gsub(/\t/,"|",$0)}1' > $temp/html_fields/$id"_Season_Ep_06.txt"
#
#echo "---> Si ce n'est pas une serie et que le fichier Season_Ep_06.txt est vide creer un |"
#File_episode=$temp/html_fields/$id"_Season_Ep_06.txt"
#if [ -s "$File_episode" ]
#then
#echo "$File_episode has some data."
#else
#echo "$File_episode is empty adding one |."
#echo "|" > $File_episode
#fi
#echo "---> Remplacement (en place) du header Season_Ep 2 Cells a coller"
#awk 'BEGIN{print " "}{print}' $temp/html_fields/$id"_Season_Ep_06.txt" > $temp/html_fields/$id"_Season_Ep_07.txt"
#sed -i.bak "1 s/^.*$/season|episode/" $temp/html_fields/$id"_Season_Ep_07.txt"
#
#awk -F '|' '{ print $1, $2}' OFS="|" $temp/html_fields/$id"_Season_Ep_07.txt" > $temp/CSV_FIELDS/$id"_Season_EP.csv"
#
#










