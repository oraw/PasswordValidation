#!/bin/bash
#############################
#password-validator.sh      #
#############################
#initial version,01/03/2022 #
#############################
# prints colored text
print_style () {

   if [ "$2" == "info" ] ; then
       COLOR="96m";
   elif [ "$2" == "success" ] ; then
       COLOR="92m";
   elif [ "$2" == "warning" ] ; then
       COLOR="93m";
   elif [ "$2" == "danger" ] ; then
       COLOR="91m";
   else #default color
       COLOR="0m";
   fi

   STARTCOLOR="\e[$COLOR";
   ENDCOLOR="\e[0m";

   printf "$STARTCOLOR%b$ENDCOLOR" "$1";
}

#print_style "This is a green text " "success";
#print_style "This is a yellow text " "warning";
#print_style "This is a light blue with a \t tab " "info";
#print_style "This is a red text with a \n new line " "danger";
#print_style "This has no color";

if [ "$1" == "-f" ] ; then
   #echo $1
   password=`cat password.txt`
   #echo $password
else
   echo "Please enter the password"
   read password
fi

#echo "Please enter the password"
#read password

len="${#password}"
rtrn=1

if test $len -ge 10 ; then

    echo "$password" | grep -q [0-9]

     if test $? -eq 0 ; then
           echo "$password" | grep -q [A-Z]
                if test $? -eq 0 ; then
                    echo "$password" | grep -q [a-z]   
                      if test $? -eq 0 ; then
                       #echo "Strong password"
		       let rtrn=0
                       print_style "Strong password, success \n" "success";
                   else
                       #echo "Weak password , please include lower case char"
                       print_style "Weak password, please lower case char \n" "danger";
                   fi
            else
               #echo "Weak password,please include capital char" 
               print_style "Weak password, please include capital char \n" "danger";
            fi
     else
       #echo "Weak password, please include the numbers in password"   
       print_style "Weak password, please include the numbers in password \n" "danger";
     fi
else
    #echo "Weak password, password lenght should be greater than or equal 10"
    print_style "Weak password, password lenght should be greater than or equal 10 \n" "danger";
fi

echo $rtrn
echo $str

