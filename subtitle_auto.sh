read -p "T.C IN : " tcin
echo $tcin
read -p "T.C OUT : " tcout
echo $tcout

some_data=$(<"$1")
backsource=$(echo "$1"| sed 's/.srt/_Source.srt/g')


tclsh tcl.sh "$1" "$tcin" "$tcout" > "$1"_temp
mv "$1" "$backsource"
mv "$1"_temp "$1"
