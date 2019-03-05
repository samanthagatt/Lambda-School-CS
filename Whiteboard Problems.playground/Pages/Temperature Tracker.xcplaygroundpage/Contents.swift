//: [Previous](@previous)

import Foundation

// O(n) space complexity
// O(1) time complexity
class TempTracker {
    
    private var storage: [Int: Int] = [:]
    private var count = 0
    private var min = Int.max
    private var max = Int.min
    private var mean: Float = 0.0
    private var highestCount = 0
    private var mode = 0
    
    
    /// Records a new temperature
    func insert(_ int: Int) {
        
        // Adds int to storage dictionary
        let countOfInt: Int
        if let countInStorage = storage[int] {
            storage[int] = countInStorage + 1
            countOfInt = countInStorage + 1
        } else {
            storage[int] = 1
            countOfInt = 1
        }
        
        // Increments count
        count += 1
        
        // Keeps track of mode
        if countOfInt > highestCount {
            mode = int
            highestCount = countOfInt
        }
        
        // Keeps track of max
        if int > max {
            max = int
        }
        
        // Keeps track of min
        if int < min {
            min = int
        }
        
        // Calculates old sum
        var sum = mean * Float(count - 1)
        // Adds new int to sum
        sum += Float(int)
        // Divides by new count
        mean = sum / Float(count)
        
    }
    
    /// Returns the highest temperature we've seen so far
    func getMax() -> Int {
        return max
    }
    
    /// Returns the lowest temperature we've seen so far
    func getMin() -> Int {
        return min
    }
    
    /// Returns the mean of all temperatures we've seen so far
    func getMean() -> Float {
        return mean
    }
    
    /// Returns a mode of all temperatures we've seen so far
    func getMode() -> Int {
        return mode
    }
}

var tracker = TempTracker()
tracker.insert(32)

print("mean:", tracker.getMean())   // should print 32.0
print("min:", tracker.getMin())     // should print 32
print("max:", tracker.getMax())     // should print 32
print("mode:", tracker.getMode())   // should print 32

print()
tracker.insert(135)

print("mean:", tracker.getMean())   // should print 83.5
print("min:", tracker.getMin())     // should print 32
print("max:", tracker.getMax())     // should print 135

print()
tracker.insert(135)

print("mean:", tracker.getMean())   // should print 100.666664
print("min:", tracker.getMin())     // should print 32
print("max:", tracker.getMax())     // should print 135
print("mode:", tracker.getMode())   // should print 135

//: [Next](@next)
