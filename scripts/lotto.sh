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
		    # Add members to array picks. Notice the quotes.	
			picks+=("$n")
	    done
		# echo out the array notice the brackets 
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
		    # Add members to array picks. Notice the quotes.	
			picks+=("$n")
	    done
		# echo out the array notice the brackets 
		echo "${picks[@]}" |tr " " "\n" | sort -n | tr "\n" " " 	

}


illinois_lotto_numbers(){

	    #This is how you declare a empty array in bash	
		declare -a picks
		# This is how you create a loop in Bash
		for ((p = 1; p <= 5; ++p));do
		    # This is how you initialize a variable in bash
			#also take note of stdout stream 1 to /dev/null
			n=$(shuf -i 1-52 -n 1) 1>/dev/null 
		    # Add members to array picks. Notice the quotes.	
			picks+=("$n")
	    done
		# echo out the array notice the brackets 
		echo "${picks[@]}"


}

megaball_number(){
		
		red=`tput setaf 1`
		reset=`tput sgr0`
		n=$(shuf -i 1-25 -n 1) 1>/dev/null
        echo "${red}$n ${reset}"




}

powerball_number(){

		red=`tput setaf 1`
		reset=`tput sgr0`
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

#echo "$game"

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
				printf '%s %s\n' "$(mega_first_five_num)""$(megaball_number)"
				
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
				printf '%s %s\n' "$(powerball_first_five_numbers)""$(powerball_number)"
				
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

