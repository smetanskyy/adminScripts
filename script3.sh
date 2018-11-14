#! /bin/bash

sleep 5
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
SEA_COLOUR="\033[36m"
NORMAL="\033[0m"
ShowMenuMain() {
echo -e "$GREEN   MENU
1 - SEARCH
2 - STATISTICS
3 - EXIT$NORMAL"
}

EnterChoice(){
echo -en "${RED}\nEnter your choice: $NORMAL"
}

ShowSearchMenu(){
echo -e "$BLUE   SEARCH MENU
1 - email
2 - phone
3 - city
4 - name
5 - surname
6 - return$NORMAL"
}

ShowStatisticsMenu(){
echo -e "$SEA_COLOUR  STATISTICS MENU
1 - How many the same email
2 - How many the same city
3 - How many people have the age in range [ ]
4 - How many the same phone operator
5 - return$NORMAL"
}

while true;
do
clear
ShowMenuMain
EnterChoice
read choice
case $choice in
1) while (($choice!=6));
do
clear
ShowSearchMenu
EnterChoice
read choice
case $choice in
1) echo -e "EMAILS:"
echo -e "Enter a kind of email (gmail.com etc):"
read mail
grep -i "@$mail  " database
sleep 4
;;
2) echo -e "PHONES:"
echo -e "Enter a kind of operator (067 or 050 .. etc):"
read phone
grep -iE "   ($phone)[0-9]+" database
sleep 4
;;
3) echo -e "CITIES:"
#awk '{print $6}' database
cities=`awk '{print $6}' database | sort -d`
touch temp
for city in $cities;
do
if grep -i "$city" temp > /dev/null
then
continue
else
echo "$city" >> temp
echo "All cities:"
tail temp
echo "Enter a city: "
read city
grep -i "  $city" temp
rm -f temp
sleep 4
;;
4) echo -e "NAMES: "
echo "Enter name: "
read name
grep -i "$name  " database
sleep 5
;;
5) echo -e "SURNAME: "
echo "Enter surname: "
read surname
grep -i "  $surname  " database
sleep 5
;;
6) echo -en "${SEA_COLOUR}You are coming back!$NORMAL"
sleep 1
;;
*) echo -en "${RED}TRY AGAIN!$NORMAL"
sleep 1
;;
esac 
done
;;
2) while (($choice!=5));
do
clear
ShowStatisticsMenu
EnterChoice
read choice
case $choice in
1) all_emails=`awk '{print $5}' database | grep -Eio "@[a-z]+\.[a-z]+" | grep -Eio "[a-z]+\.[a-z]+" | sort -d`
touch temp
for email in $all_emails;
do
if grep -i "$email" temp > /dev/null
then
continue
else
echo "$email" >> temp
fi
done
while read line
do
echo -e "$line count: `grep -c "$line" database`"
sleep 2
done < "temp"
sleep 2
rm -f temp
;;
2) all_cities=`awk '{print $6}' database | sort -d`
touch temp
for city in $all_cities;
do
if grep -i "$city" temp > /dev/null
then
continue
else
echo "$city" >> temp
fi
done
while read line
do
echo -e "$line count: `awk '{print $6}' database | grep -c "$line"`"
sleep 2
done < "temp"
sleep 2
rm -f temp
;;
3) echo -e "Age untill 19 years: "
echo -n "count: "
grep -c "   1[0-9]   " database

echo -e "Age 20 - 39 years: "
echo -n "count: "
grep -c "   [2-3][0-9]   " database

echo -e "Age 40 - 59 years: "
echo -n "count: "
grep -c "   [4-5][0-9]   " database

echo -e "Age 60 - 99 years: "
echo -n "count: "
grep -c "   [6-9][0-9]   " database

echo -e "Age 100 and more years: "
echo -n "count: "
grep -c "   [1-9][0-9][0-9]   " database

sleep 4
;;
4) echo -e "The same phone operator"
all_operators=`awk '{print $4}' database | grep -Eio "([0-9]+)" | grep -Eio "[0-9]+" | sort -d`
touch temp
for operator in $all_operators;
do
if grep -i "$operator" temp > /dev/null
then
continue
else
echo "$operator" >> temp
fi
done
while read line
do
echo -e "$line count: `grep -c "($line)" database`"
sleep 2
done < "temp"
sleep 2
rm -f temp
;;
5) echo -en "You are coming back"
sleep 1
;;
*)echo -en "TRY AGAIN!"
sleep 1
;;
esac
done
;;
3) echo -e "${YELLOW}Good bye $NORMAL"
sleep 1
clear
exit 0
;;
*) echo -e "${YELLOW}TRY AGAIN! $NORMAL"
sleep 1
;;
esac
done
