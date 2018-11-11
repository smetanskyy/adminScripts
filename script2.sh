#! /bin/bash

menuMAIN() {
echo -e "   \033[32m MENU    
1 - Show User Name;
2 - Show Date;
3 - Show Timework;
4 - MEMORY INFO;
5 - HARDDISK INFO;
6 - EXIT\n\033[0m"
}
menuDATE() {
echo -e "\033[32m Date format:
1 - All info;
2 - Format: Year-Month-Day;
3 - Return;\n\033[0m"
}
enterChoice() {
echo -en "\033[33m Enter your choice: \033[0m"
}

while true;
do

clear
menuMAIN
enterChoice
read choice 
case $choice in
1) echo -e "\033[31;1m USERNAME: `users` \033[0m"
   sleep 2
;;
2) while ((choice!=3));
do 
   clear
   menuDATE
   enterChoice
   read choice
   case $choice in
	1)echo -e "\033[34mALL FORMAT: `date` \033[0m"
	sleep 2
	choice=3
;;
	2)echo -e "\033[35mDATE: `date +"%Y-%m-%d"` \033[0m"
	sleep 2
	choice=3
;;
	3)echo -e "\033[36mCome back \033[0m"
	sleep 2
;;
	*)echo -e "error"
	sleep 1
;;
   esac
done
;;
3) echo -e "\033[031m TIMEWORK: `uptime`\033[0m"
   sleep 2
;;
4) echo -e "\033[035m MEMORY INFO:\n`free -m`\033[0m"
   sleep 2
;;
5) echo -e "\033[036m HARDDISK INFO:\n`df -H`\033[0m"
   sleep 2
;;
6) echo -e "\033[34m Good bye\033[0m"
   sleep 1
   clear
   exit 0
;;
*) echo -e "error"
   sleep 1
;;
esac
done

