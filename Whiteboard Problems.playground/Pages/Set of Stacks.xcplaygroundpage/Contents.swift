//: [Previous](@previous)

import Foundation


class SetOfStacks<T> {
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    // Capacity
    var capacity: Int
    
    // An array that holds all the stacks
    var mainArray: [[T]] = []
    
    // Count var
    var count: Int {
        return mainArray.count
    }
    
    // push
    func push(_ item: T) {
        // check if mainArray is empty
        if mainArray.count == 0 {
            mainArray.append([item])
            return
        }
        guard var lastArray = mainArray.last else { return }
        if lastArray.count == capacity {
            mainArray.append([item])
        } else {
            lastArray.append(item)
            mainArray[count - 1] = lastArray
        }
    }
    
    // pop
    func pop() -> T? {
        guard var lastArray = mainArray.last else { return nil }
        if lastArray.count == 0 {
            mainArray.popLast()
        }
        if mainArray.count > 0 {
            let item = lastArray.popLast()
            if lastArray.count == 0 {
                mainArray.popLast()
            } else {
                mainArray[count - 1] = lastArray
            }
            return item
        }
        return nil
    }
    
    func popAt(_ index: Int) -> T? {
        
        // all indexes == count * capacity - 1 + lastArray.count
        let arrayIndex = index / count
        let indexWithinArray = index % count
        
        print(arrayIndex, indexWithinArray)
        
        return nil
    }
}


// declare a new `SetOfStacks` where each stack has a capacity of 3
var stacks = SetOfStacks<Int>(3)

stacks.push(10)
stacks.push(9)
stacks.push(8)
stacks.push(7)

print(stacks.count)   // should print 2

print(stacks.popAt(3) ?? "None") // should print 8
print(stacks.pop() ?? "None")    // should print 7
print(stacks.pop() ?? "None")    // should print 9

print(stacks.count)   // should print 1

//: [Next](@next)
