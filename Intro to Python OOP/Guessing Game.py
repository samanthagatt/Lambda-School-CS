import random


def guessing_game():
    print("Guess the number")

# game picks a random number between 0 and 100
secret_number = random.randrange(101)

# loop forever until either the user guess correctly
# or the user quits the game
while True:
    # prompt the user to make a guess
    guess = input("Input your guess: ")

    # make sure the input is of the proper format
    try:
        guess = int(guess)
    except ValueError:
        print("Please enter an integer")

    print(f"You guessd: {guess}")

    # check to see if the guess is too high, too low, or correct
    if guess == secret_number:
        print("You win!")
        break
    elif guess < secret_number:
        print("Too small!")
    elif guess > secret_number:
        print("Too big!")
