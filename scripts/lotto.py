# This is a lotto python script that asks to play powerball, MegaMillions or
# Illinois Lottery

# import the os module which calls OS programs
import os
# import random for generating random numbers.
import random

# Lets clear the screen first
os.system('clear')


# Functions
def mega_first_five_num():
    # Setup an empty array
    picks = []
    # setup a for loop
    for p in range(1, 5):
        # create the variable for random number
        n = random.randint(1, 70)
        # We have to see if this number is in the array if it is then generate
        # number again
        if n in picks:
            n = random.randinit(1, 70)
    # Add the number to the array
    picks.appand(n)


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
