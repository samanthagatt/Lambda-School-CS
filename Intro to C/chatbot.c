#include <stdio.h>
#include <string.h>

// recieve user input from standard input
// user can enter 'q' to exit
// respond to the user's input

int main(void)
{
    char first_name[20];
    char input[100];
    printf("Chatbot: Hello there! What is your first name?\n");
    printf("Your name: ");
    scanf("%s", first_name);
    printf("Input: ");
    scanf("%s100[^\n]", input);
    printf("Hello, %s!\n", first_name);
    printf("%s\n", input);
    return 0;
}
