# This is a lotto python script that asks to play powerball, MegaMillions or
# Illinois Lottery

# import the os module which calls OS programs
import os
# import random for generating random numbers.
import random
# import color for try:
# from colorama import Fore


# Lets clear the screen first
os.system('clear')


# Functions
def mega_first_five_num():
    # Setup an empty array
    picks = []
    # setup a for loop
    while len(picks) < 5:
        # create the variable for random number
        n = random.randint(1, 70)
        # We have to see if this number is in the array if it is then generate
        # number again
        if n in picks:
            n = random.randint(1, 70)
        else:
            # Add the number to the array
            picks.append(n)
    # Convert the picks to string to get rid of [ and ]
    picks_string = ", ".join(str(n) for n in sorted(picks))
    # Return the array sorted
    return picks_string


def powerball_first_five_num():
    # Setup empty array
    picks = []
    # setup a for loop
    while len(picks) < 5:
        # create the variable for random number
        n = random.randint(1, 69)
        # We have to see if this number is in the array if it is then generate
        # number again
        if n in picks:
            n = random.randint(1, 69)
        else:
            # Add the number to the array
            picks.append(n)
    # Convert the picks to string to get rid of [ and ]
    picks_string = ", ".join(str(n) for n in sorted(picks))
    # Return array sorted
    return picks_string


def illinois_lottery_num():
    # Setup empty array
    picks = []
    # setup a for loop
    while len(picks) < 5:
        # create the variable for random number
        n = random.randint(1, 45)
        # We have to see if this number is in the array if it is then generate
        # number again
        if n in picks:
            n = random.randint(1, 45)
        else:
            # Add the number to the array
            picks.append(n)
    # Convert the picks array to string to get rid of [ and ]
    picks_string = ", ".join(str(n) for n in sorted(picks))
    # Return the array sorted
    return picks_string


def megaball_number():
    # Create random number for megaball for n
    n = random.randint(1, 25)
    # Print out megaball in red
    # print("\033[1;31;40m{}\033[0m".format(n))
    return n


def powerball_number():
    # Create random number for powerball for nex
    n = random.randint(1, 26)
    # Print out powerball number in red
    return n


# Print the game to the user and let user pick the game.
print("Welcome to your lottery numbers Good Luck Chris!")
print("===============================")
print()

print("Which game would you like to play:")
print("1. MegaMillions")
print("2. Powerball")
print("3. Illinois Lottery")
print()

# Do a try block
while True:
    try:
        game = int(input('Enter the number for your game: '))
        if 1 <= game <= 3:
            break
        else:
            print("Invalid input. Please try again.")
    except ValueError:
        print("Invalid input. Please enter a valid number.")

# After the user has chosen the number ask how many tickets
# Notice the == in the if statement
if game == 1:
    # Ask user how many tickets
    num_tickets = int(input('How many tickets would you like ? '))
    print()
    print("Here is your Megamillion Numbers")
    print("=================================")
    print()
    for t in range(0, num_tickets):
        print(mega_first_five_num(), "\033[1;31;40m{}\033[0m".format(megaball_number()))

if game == 2:
    # Ask user how many tickets
    num_tickets = int(input('How many tickets would you like ? '))
    print()
    print("Here is your PowerBall Numbers")
    print("==============================")
    for t in range(0, num_tickets):
        print(powerball_first_five_num(),  "\033[1;31;40m{}\033[0m".format(powerball_number()))

if game == 3:
    # Ask user how many tickets
    num_tickets = int(input('How many tickets would you like ? '))
    print()
    print("Here is your Illinois Numbers")
    print("=============================")
    for t in range(0, num_tickets):
        print(illinois_lottery_num())
