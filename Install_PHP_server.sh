#/bin/bash!
echo "Je Suis Install_PHP_server.sh"

#Description of Colors cd to the sript directory server.sh

red=`tput setaf 1`
bluelight=`tput setaf 6`
White=`tput setaf 7`
reset=`tput sgr0`

#cd to the script working directory
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)

if ((${EUID:-0} || "$(id -u)")); then
sudo rm All.phpe All.php IMG.phpe IMG.php link_IMG.txt PHP-IMDB/IMG/* Template_ALL.php Le_nom_url_Poster_OO.jpg
sudo chmod 777 $dir
echo "
${White}
  >=>>=>   >=======> >======>   >=>         >=> >=======> >======>
>=>    >=> >=>       >=>    >=>  >=>       >=>  >=>       >=>    >=>
 >=>       >=>       >=>    >=>   >=>     >=>   >=>       >=>    >=>
    >=>    >=====>   >> >==>       >=>   >=>    >=====>   >> >==>
      >=>  >=>       >=>  >=>       >=> >=>     >=>       >=>  >=>
=    >=>   >=> >=>   >=>    >=>      >===>      >=>       >=>    >=>
>=>>=>     >=======> >=>      >=>     >=>       >=======> >=>      >=>

########################################################################

#       PHP-IMDB-Grabber &  wikipedia-movie-data from GitHub           #

#############################################@##########################
${reset}
"
# Début du script

echo "--> Greation des dossiers servers/php et servers/jsomp"


if [ ! -d servers ]; then
rm -R servers
mkdir -p servers
fi
echo "--> Git clone https://github.com/FabianBeiner/PHP-IMDB-Grabber.git PHP-IMDB"

if [ ! -d PHP-IMDB ]; then
git clone https://github.com/FabianBeiner/PHP-IMDB-Grabber.git PHP-IMDB
fi
mkdir -p servers/PHP-IMDB/TXT_PROC IMG
sudo chmod -R 777 servers/PHP-IMDB/TXT_PROC IMG
sudo chown -R _WWW:_WWW PHP-IMDB
echo "--> generating base template"
sudo -u _WWW echo "<?php
include_once 'servers/PHP-IMDB/imdb.class.php';
\$IMDB = new IMDB('FILM TITLE OR IMDB ID');
if (\$IMDB->isReady) {
print_r(\$IMDB->STRING TO REPLACE);
} else {
echo 'Movie not found. 😞';
}
?>" > Template_ALL.php
cp Template_ALL.php servers/PHP-IMDB/TXT_PROC/Template_ALL.php
sudo mv IMG servers/
sudo mv PHP-IMDB/* servers/PHP-IMDB/
sudo rm -R PHP-IMDB
echo "${bg_green}${white}
#########################
##  INSTALLATION DONE  ##
#########################
${reset}
"



else
echo "

${red}###################################################

#######${reset}${White}  DO NOT RUN THIS PROGRAM AS ROOT!   ${red}#######
${red}#######${reset}${White}      USE 'sudo ./servers.sh'        ${red}#######

###################################################
${reset}
"
fi
exit

