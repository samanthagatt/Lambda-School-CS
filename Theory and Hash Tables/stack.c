#include <stdio.h>
#include <stdlib.h>

typedef struct Stack
{
    /// Total number of elements the stack can hold
    unsigned int capacity;
    /// Pointer to data
    int *data;
    /// Index for element at top of stack
    int top;
} Stack;

Stack *create_stack(unsigned int capacity)
{
    Stack *stack = malloc(sizeof(Stack));
    stack->capacity = capacity;
    stack->top = -1;
    stack-> data = malloc(capacity * sizeof(int));
    return stack;
}

int is_full(Stack *stack)
{
    return stack->top == stack->capacity - 1;
}

int is_empty(Stack *stack)
{
    return stack->top == -1;
}

void push(Stack *stack, int item)
{
    if (is_full(stack))
    {
        stack->capacity *= 2;
        stack->data = realloc(stack->data, stack->capacity * sizeof(int));
    }

    // stack->top++;
    // stack->data[stack->top] = item;
    stack->data[++stack->top] = item;
}

int pop(Stack *stack)
{
    if (is_empty(stack))
    {
        return -1;
    }

    return stack->data[stack->top--];
}

void free_stack(Stack *stack)
{
    free(stack->data);
    free(stack);
}

// int main(void)
// {
//     Stack *stack = create_stack(3);

//     printf("Stack is full: %d\n", is_full(stack)); // 0
//     printf("Stack is empty: %d\n", is_empty(stack)); // 1

//     push(stack, 10);
//     printf("Stack is empty: %d\n", is_empty(stack)); // 0
//     push(stack, 20);
//     push(stack, 30);

//     printf("Stack is full: %d\n", is_full(stack)); // 1

//     push(stack, 40);

//     printf("Stack is full: %d\n", is_full(stack)); // 0

//     printf("%d popped from stack\n", pop(stack)); // 40
//     printf("%d popped from stack\n", pop(stack)); // 30
//     printf("%d popped from stack\n", pop(stack)); // 20
//     printf("%d popped from stack\n", pop(stack)); // 10

//     printf("Stack is empty: %d\n", is_empty(stack)); // 1
// }