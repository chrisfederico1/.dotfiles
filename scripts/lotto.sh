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
		echo "${picks[@]}"
		
		
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
		echo "${picks[@]}"
		

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

		n=$(shuf -i 1-25 -n 1) 1>/dev/null
		return $n

}

powerball_number(){

		n=$(shuf -i 1-26 -n 1) 1>/dev/null
		return $n
}

#Clear screen
#clear

# Ask player to pick game.

echo "Welcome to the lotto Good luck Chris"
echo "===================================="
echo
echo


echo "Pick which game you want to play:"
echo "1. Mega Millions"
echo "2. PowerBall"
echo "3. Illinois Lotto"

read -p ">" game

echo "$game"


