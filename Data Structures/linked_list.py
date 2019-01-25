"""
Class that represents a single linked
list node that holds a single value
and a reference to the next node in the list
"""
class Node:
    def __init__(self, value=None, next_node=None):
        self.value = value
        self.next_node = next_node

    def get_value(self):
        return self.value

    def get_next(self):
        return self.next_node

    def set_next(self, new_next):
        self.next_node = new_next  # O(1)

class LinkedList:
    def __init__(self):
        self.head = None
        self.tail = None
        self.max = None

    def add_to_tail(self, value):
        node = Node(value)
        if self.tail:
            self.tail.set_next(node)
            self.tail = node
            if self.max.value < node.value:
                self.max = node
        else:  # storage is empty
            self.head = node
            self.tail = node
            self.max = node

    # O(1)
    def remove_head(self):
        if self.head:
            old_head = self.head
            self.head = old_head.next_node

            if self.head is None:
                self.tail = None
                self.max = None
            
            return old_head.value

    def contains(self, value):
        if self.head.value == value:
            return True
        else:
            if self.head.next_node:
                self.head.next_node.contains(value)
            else:
                return False

    def get_max(self):
        return self.max.value if self.max else None
