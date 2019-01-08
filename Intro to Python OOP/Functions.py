import sys

# Write a func that counts the number of vowels in an input string


def vowel_count(string):
    # check how many vowels
    # iterate through the string
    # create an array of vowels to check against
    vowels = ['a', 'e', 'i', 'o', 'u']
    count = 0
    for char in string:
        # check if this char exists in vowels
        if char in vowels:
            # need to increment count
            count += 1
    return count


def simple_vowel_count(s):
    return sum(char in 'aeiou' for char in s.lower())

l = len(sys.argv)

if l != 2:
    print('usage: python_demo.py [word]')
else:
    print(simple_vowel_count(sys.argv[1]))
