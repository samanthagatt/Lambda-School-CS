//: [Previous](@previous)


class RingBuffer<T> {
    
    init(capacity: Int) {
        self.capacity = capacity
        self.storage = [T?](repeating: nil, count: capacity)
    }
    
    let capacity: Int
    private var index = 0
    private var storage: [T?]
    var allValues: [T] {
        // maps storage to non optional
        return storage.compactMap() { $0 }
    }
    
    func append(_ item: T) {
        // assign new value at index
        storage[index] = item
        // increment index
        index += 1
        // if index reaches capacity start back at 0
        if index == capacity {
            index = 0
        }
    }
}


let buffer = RingBuffer<String>(capacity: 5);

buffer.append("a");
buffer.append("b");
buffer.append("c");
buffer.append("d");
print(buffer.allValues);  // should print ["a", "b", "c", "d"]

buffer.append("e");
print(buffer.allValues);  // should print ["a", "b", "c", "d", "e"]

buffer.append("f");
print(buffer.allValues);  // should print ["f", "b", "c", "d", "e"]

buffer.append("g");
buffer.append("h");
buffer.append("i");
print(buffer.allValues);  // should print ["f", "g", "h", "i", "e"]

//: [Next](@next)
