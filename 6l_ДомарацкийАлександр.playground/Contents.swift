import Foundation

struct Queue<T> : CustomStringConvertible {
    private(set) var array: [T] = []
    subscript(safe index: Int) -> T? {
        return array.indices ~= index ? array[index] : nil
    }
    var description: String {
               return "Содержимое очереди: \(self.array)"
           }
    var count: Int {
            return array.count
        }
    mutating func addToQueue(_ element: T) {
        array.append(element)
    }
    mutating func deleteFromQueue() -> T {
        return array.removeFirst()
    }


    func filter(_ someCondition: (T) -> Bool) -> Queue<T> {
        var newArray = [T]()
        for element in array {
            if someCondition(element) {
                newArray.append(element)
            }
        }
        var queue: Queue<T> = Queue()
        queue.array = newArray
        return queue
    }
    func compactMap<A> (_ someCondition: (T) -> A?) -> Queue<A> {
        var newArray = Array<A>()
        for element in array {
            if let temp = someCondition(element) {
                newArray.append(temp)
            }
        }
        var newQueue = Queue<A>()
        newQueue.array = newArray
        return newQueue
    }
}

var queueOfString = Queue<String>()
queueOfString.addToQueue("two")
queueOfString.addToQueue("2")
queueOfString.addToQueue("seven")
queueOfString.addToQueue("5")
queueOfString[safe: 2]
queueOfString[safe: 4]
print(queueOfString)
//let newQueue = queueOfString.filter{ !$0.contains("two") }
let newQueue = queueOfString.filter{ $0.contains("2") || $0.contains("two") }
print(newQueue)
let comQueue = newQueue.compactMap{ Int($0) }
print(comQueue)








