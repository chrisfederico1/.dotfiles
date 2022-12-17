#!/bin/bash
#set -x


# Function to get first 5 numbers of the mega millions lottery

mega_first_five_num (){

	    #This is how you declare a empty array in bash	
		declare -a picks
		# This is how you create a loop in Bash
		for ((p = 1; p <= 5; ++p));do
		    # This is how you initialize a variable in bash
			#also take note of stdout stream 1 to /dev/null
			n=$(shuf -i 1-70 -n 1) 1>/dev/null

			#Check to see if this value is in array if so generate another number
			if [[ ${picks[*]} =~  ${n}  ]]; then
				n=$(shuf -i 1-70 -n 1) 1>/dev/null
			fi
		    # Add members to array picks. Notice the quotes.	
			picks+=("$n")
	    done
		# echo out the array notice the brackets. There is also 
		# a sort in this command users tr to replace spaces with 
		# line returns . Then the sort command happens. -n is sort
		# Numerical .
		# Then the last tr replaces line returns back to spaces

		echo "${picks[@]}" |tr " " "\n" | sort -n | tr "\n" " "
		
		
}


powerball_first_five_numbers(){


	    #This is how you declare a empty array in bash	
		declare -a picks
		# This is how you create a loop in Bash
		for ((p = 1; p <= 5; ++p));do
		    # This is how you initialize a variable in bash
			#also take note of stdout stream 1 to /dev/null
			n=$(shuf -i 1-69 -n 1) 1>/dev/null 
	
	#Check to see if this value is in array if so generate another number
			if [[  ${picks[*]}  =~  ${n}  ]]; then
				n=$(shuf -i 1-69 -n 1) 1>/dev/null
			fi

	# Add members to array picks. Notice the quotes.	
			picks+=("$n")
	    done


		# echo out the array notice the brackets. There is also 
		# a sort in this command users tr to replace spaces with 
		# line returns . Then the sort command happens. -n is sort
		# Numerical .
		# Then the last tr replaces line returns back to spaces
		echo "${picks[@]}" |tr " " "\n" | sort -n | tr "\n" " " 	

}


illinois_lotto_numbers(){

	    #This is how you declare a empty array in bash	
		declare -a picks
		# This is how you create a loop in Bash
		for ((p = 1; p <= 5; ++p));do
		    # This is how you initialize a variable in bash
			#also take note of stdout stream 1 to /dev/null
			n=$(shuf -i 1-45 -n 1) 1>/dev/null 
		  
	#Check to see if this value is in array if so generate another number
			if [[  ${picks[*]}  =~  ${n}  ]]; then
				n=$(shuf -i 1-45 -n 1) 1>/dev/null
			fi


		  # Add members to array picks. Notice the quotes.	
			picks+=("$n")
	    done
		 # echo out the array notice the brackets. There is also 	
		 # a sort in this command users tr to replace spaces with 	
         # line returns . Then the sort command happens. -n is so
         # Numerical .Then the last tr replaces line returns back to spaces
 	echo "${picks[@]}" |tr " " "\n" | sort -n | tr "\n" " " 	

 }


megaball_number(){
		# Uses tput to change color of text	
		red=$(tput bold)$(tput setaf 1)
		reset=$(tput sgr0)
		n=$(shuf -i 1-25 -n 1) 1>/dev/null
        
		# Change text to red then reset back 
		echo "${red}$n ${reset}"




}

powerball_number(){

		red=$(tput bold)$(tput setaf 1)
		reset=$(tput sgr0)
		n=$(shuf -i 1-26 -n 1) 1>/dev/null
	echo "${red}$n ${reset}"	
}

#Clear screen
clear

# Ask player to pick game.

echo "Welcome to the lotto Good luck Chris"
echo "===================================="
echo
echo
echo "Pick which game you want to play:"
echo "1. Mega Millions"
echo "2. Power Ball"
echo "3. Illinois Lotto"

read -r -p ">" game
echo
echo


# check what game the user choose and continue

if [ "$game" = 1 ]
then
		#ask how many mega million tickets 
		echo "How many tickets do you want to play ? "
		read -r -p ">" num_tickets
		echo ""; echo "";
		echo "Mega Million Numbers"
		echo "===================="
		echo ""

		for ((t = 1; t <= "$num_tickets"; ++t));do
				# ToDo find out what %s means 
				printf '%s\n' "$(mega_first_five_num)""$(megaball_number)"
				
	done

fi


if [ "$game" = 2 ]
then
		#ask how many powerball tickets 
		echo "How many tickets do you want to play ? "
		read -r -p ">" num_tickets
		echo ""; echo "";
		echo "PowerBall Numbers"
		echo "================="
		echo ""

		for ((t = 1; t <= "$num_tickets"; ++t));do
				printf '%s\n' "$(powerball_first_five_numbers)""$(powerball_number)"
				
	done

fi


if [ "$game" = 3 ]
then
		#ask how many Illinois tickets 
		echo "How many tickets do you want to play ? "
		read -r -p ">" num_tickets
		echo ""; echo "";
		echo "Illinois Numbers"
		echo "================"
		echo ""

		for ((t = 1; t <= "$num_tickets"; ++t));do
				printf '%s\n' "$(illinois_lotto_numbers)" 
				
	done

fi

# Error handling 

if [ "$game" -lt 1 ] || [ "$game" -gt 3 ]
then
		echo "Please enter valid entry"
fi

