//: [Previous](@previous)
/*:
 # Implement a Queue with Two Stacks
 
 Given two Stack instances (i.e. Stacks exhibit LIFO ordering and only have access to the methods `push` and `pop`), implement a Queue data structure with the methods `enqueue`, `dequeue`, and `peek` (returns the same result as calling `dequeue` but doesn't change the queue). Your Queue should of course exhibit FIFO ordering.
 
 Analyze the time and space complexity of your solution.
 */
class Queue<T> {
    var outbox: [T] = []
    var inbox: [T] = []
    
    func enqueue(_ item: T) {
        inbox.append(item)
    }
    
    func dequeue() -> T? {
        while inbox.last != nil {
            let item = inbox.popLast()!
            outbox.append(item)
        }
        let item = outbox.popLast()
        while outbox.last != nil {
            let item = outbox.popLast()!
            inbox.append(item)
        }
        return item
    }
    
    func peek() -> T? {
        while inbox.last != nil {
            let item = inbox.popLast()!
            outbox.append(item)
        }
        let item = outbox.last
        while outbox.last != nil {
            let item = outbox.popLast()!
            inbox.append(item)
        }
        return item
    }
}

var q = Queue<Int>()
print(q.peek() ?? "None")   // should print None

q.enqueue(10)
print(q.peek() ?? "None")   // should print 10

q.enqueue(9)
q.enqueue(8)

print(q.dequeue() ?? "None")   // should print 10
print(q.dequeue() ?? "None")   // should print 9
print(q.dequeue() ?? "None")   // should print 8
//: [Next](@next)
