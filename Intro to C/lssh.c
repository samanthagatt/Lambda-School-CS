#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>

#define MAX_TOKENS 100

char **parse_commandline(char *str, int *argc, char **args)
{
    char *token;
    *argc = 0;

    // Break the given str into tokens using a deliniter
    // split on tabs, newlines, and character turn
    token = strtok(str, " \t\n\r");

    // Add this token to the args array
    while (token != NULL && *argc < MAX_TOKENS)
    {
        // Index into args array using the value in argc
        // Then increment *argc
        args[(*argc)++] = token;
        printf("token: %s", token);
        
        // Fetch the next token
        token = strtok(NULL, " \t\n\r");
    }

    // Lastly, add a NULL as the last element in args
    // args[*argc] = NULL;
    
    return args;
}

int main(void)
{
    // Recieve input from stdin
    // Parse that inpt into tokens
    // Check for some specific commands
        // E.g. an exit command
    // To allow us to execute arbitrary programs,
    // use fork and exec in concert
    // Fork this process
    // In the child context, exec with
    // the specified program name

    // Buffers
    /// Holds entire command line input
    char commandline[1024];
    /// Holds individual parsed tokens
    /// Holds char *'s
    char **args;
    /// Number of args stored in the args array
    int argc;

    while (1)
    {
        // Recieve input from stdin
            // Shell should print a prompt for the user
        printf("lambda-shell$ ");

        // Read input from stdin
        fgets(commandline, sizeof(commandline), stdin);

        // Parse input into tokens
        // Parse the commanline buffer into individual args
        parse_commandline(commandline, &argc, args);

        // Check for specific commands
        if (argc == 0)
        {
            continue;
        }

        // Check for "exit" command
        if (argc == 1 && strcmp(args[0], "exit") == 0)
        {
            break;
        }

        // Checks for "cd" command
        if (strcmp(args[0], "cd") == 0)
        {
            if (argc != 2)
            {
                printf("usage: cd dirname\n");
                continue;
            }
            
            // Change to the specified directory
            if (chdir(args[1]) < 0)
            {
                fprintf(stderr, "chdir failed");
                continue;
            }

            // If we successfully changed directories, continue shell loop
            continue;
        }

        // Execute other commands

        pid_t child_pid = fork();

        if (child_pid < 0)
        {
            fprintf(stderr, "fork failed");
            continue;
        }

        // In child process
        if (child_pid == 0)
        {
            // Exec the child program, transforming it in the specified command
            execvp(args[0], args);

            // If we get here, exec call failed.
            fprintf(stderr, "exec failed");
            exit(1);
        }
        else
        {
            // In the parent context
            // Wait for the child to complete
            waitpid(child_pid, NULL, 0);
        }
    }

    return 0;
}