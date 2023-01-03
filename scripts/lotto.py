# This is a lotto python script that asks to play powerball, MegaMillions or
# Illinois Lottery

# Lets clear the screen first
import os
os.system('clear')

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
