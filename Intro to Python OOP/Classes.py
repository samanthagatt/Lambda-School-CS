class Dog:
    # constructor
    def __init__(self, name, age):
        self.name = name
        self.age = age

    # the repr method is defined in order to return a string
    # representation of an instance
    def __repr__(self):
        # return "{} is {} years old.".format(self.name, self.age)
        return f'{self.name} is {self.age} years old.'


arty = Dog('Arty', 4)
print(arty)


# the Bulldog class inherits from the Dog class
class Bulldog(Dog):
    def __init__(self, name, age, size):
        super().__init__(name, age)
        self.size = size

    # we'll pass name and age to the parent class for it
    # to initialize so that we don't have to duplicate code
    def __repr__(self):
        return f'{self.name} is a bulldog. It is {self.age} years old and'


buster = Bulldog('Buster', 9, 2)
print(buster)
print(buster.name)
