#! /bin/bash

touch temp
curl https://app.bitpool.com/#/login?pane=organisation > temp
clear
number=`grep -E "bpoAppVersion = \"[0-9]+\"" temp | grep -Eo "[0-9]+"`
echo -e "\nNumber from website: $number\n"
rm -f temp
hours=`date "+%H"`
echo -e "At the moment HOUR:  $hours"
minutes=`date "+%M"`
echo -e "             MINUTE: $minutes\n"
sum=$(($hours+$minutes))
echo -e "SUM hours + minutes = $sum\n"
if (($number>$sum)); then
echo -e "Number from the website more than sum of hours and minutes\n"
elif (($number==$sum)); then
echo -e "Number from the website the same as sum of hours and minutes\n"
else
echo -e "Number from the website less than sum of hours and minutes\n"
fi
