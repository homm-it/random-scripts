#!/bin/bash
#With this script you can download videos easily from www.euniverza.si

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
