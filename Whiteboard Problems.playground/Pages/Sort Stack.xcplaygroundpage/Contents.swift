//: [Previous](@previous)

import Foundation

class Stack {
    init(_ storage: [Int]) {
        self.storage = storage
    }
    
    var storage: [Int]
    
    func push(_ int: Int?) {
        if let int = int {
            storage.append(int)
        }
    }
    
    func pop() -> Int? {
        return storage.popLast()
    }
    
    func peek() -> Int? {
        return storage.last
    }
    
    func isEmpty() -> Bool {
        return storage.isEmpty
    }
}

func sortStack(_ stack: Stack) -> Stack {
    // make a new stack
    let newStack = Stack([])
    
    // repeatedly pop from input stack
    while !stack.isEmpty() {
        let int = stack.pop()
        
        while !newStack.isEmpty() && int ?? 0 < newStack.peek() ?? 0 {
            stack.push(newStack.pop())
        }
        
        newStack.push(int)
        
        // everything in newStack to always be sorted
        // compare last item in stack and newStack
        // if newStack last is greater than stack's we want to add it back to stack
        // add the stack's popped to newStack then add the next one popped (newStack's old last)
    }
    
    return newStack
}

let s = Stack([])
s.push(10)
s.push(4)
s.push(8)

print(sortStack(s).storage)


//: [Next](@next)
