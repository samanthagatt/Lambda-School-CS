#ifndef _stack_h
#define _stack_h

typedef struct Stack {
    unsigned int capacity;
    int *data;
    int top;
} Stack;

Stack *create_stack(unsigned int capacity);

int is_full(Stack *stack);

int is_empty(Stack *stack);

void push(Stack *stack, int item);

int pop(Stack *stack);

void free_stack(Stack *stack);

#endif
