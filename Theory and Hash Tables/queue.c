#include <stdio.h>
#include <stdlib.h>
#include "stack.h"

typedef struct Queue
{
    Stack *stack;
} Queue;

Queue *create_queue(unsigned int capacity)
{
    Queue *queue = malloc(sizeof(Queue));
    queue->stack = create_stack(capacity);
    return queue;
}

void enqueue(Queue *queue, int item)
{
    push(queue->stack, item);
}

int dequeue(Queue *queue)
{
    int top, result;
    top = pop(queue->stack);

    if (is_empty(queue->stack))
    {
        return top;
    }
    else {
        result = dequeue(queue);
        push(queue->stack, top);
        return result;
    }
}

void free_queue(Queue *queue)
{
    free_stack(queue->stack);
    free(queue);
}

int main(void)
{
    Queue *queue = create_queue(100);

    enqueue(queue, 10);
    enqueue(queue, 20);
    enqueue(queue, 30);

    printf("%d dequeued from queue\n", dequeue(queue));
    printf("%d dequeued from queue\n", dequeue(queue));
    printf("%d dequeued from queue\n", dequeue(queue));

    free_queue(queue);
}