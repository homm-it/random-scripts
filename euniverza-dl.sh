#!/bin/bash
#With this script you can easily download videos from www.euniverza.si

#1. Log in to www.euniverza.si and save the cookie data to cookie.txt
#2. Copy the site you want to download videos from (e.g. http://www.euniverza.si/courses/62/evropf_pravo11_ustavnopravo)
#3. Give euniverza-dl.sh execute rights (sudo chmod u+x euniverza-dl.sh)
#4. Start the script by using ./euniverza-dl.sh
#5. Enjoy!

VIDEO=()
COUNT=1
NAME=""
LINK=""

echo ""
echo "Insert HTTP link (e.g. http://www.euniverza.si/courses/62/evropf_pravo11_ustavnopravo):"
echo ""
read LINK
echo ""

echo "Specify the name of downloaded files (e.g. Ustavno pravo):"
echo ""
read NAME
echo ""

VIDEO=$(curl -q --cookie cookies.txt $LINK | grep -Po '(?<=href="/my-library/toggle/lectureId/)[^/do/add]*')

echo ""
echo "Numbers of the videos to download:"
echo $VIDEO
echo ""

NUMBER=( $VIDEO )
VLen=${#NUMBER[@]}

echo "Number of videos to download:"
echo $VLen
echo ""
echo ""
echo ""
 

for (( i=0; i<${VLen}; i++ ));
do
  wget -O "$NAME $COUNT.mp4" http://d171aj4mo5rrkj.cloudfront.net/lectures/${NUMBER[i]}/video.mp4
  let COUNT=COUNT+1
done

echo ""
echo "ALL DONE!"
echo ""
