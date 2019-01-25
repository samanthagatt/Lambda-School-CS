from linked_list import LinkedList

class Queue:
    def __init__(self):
        self.size = 0
        self.storage = LinkedList()

    def enqueue(self, item):
        if item:
            self.storage.add_to_tail(item)
            self.size += 1

    # O(1)
    def dequeue(self):
        if self.storage.head:
            self.size -= 1
            return self.storage.remove_head()

    # O(1)
    def len(self):
        return self.size

    def is_empty(self):
        return False if self.storage.head else True
