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
awk '{print $5}' database
sleep 5
;;
2) echo -e "PHONES:"
awk '{print $4}' database
sleep 5
;;
3) echo -e "CITIES:"
awk '{print $6}' database
sleep 5
;;
4) echo -e "NAMES: "
awk '{print $1}' database
sleep 5
;;
5) echo -e "SURNAME: "
awk '{print $2}' database
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
sleep 3
rm -f temp
;;
2) echo -e "TWO"
sleep 1
;;
3) echo -e "THEE"
sleep 1
;;
4) echo -e "FOUR"
sleep 1
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
