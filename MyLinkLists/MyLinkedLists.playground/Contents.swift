import UIKit
import CoreGraphics
import Foundation

var greeting = "Hello, playground"

//Link List Nodes


class Node<Value> {
    var value: Value?
    var next: Node?
    
    init(_ value: Value?, _ next: Node?) {
        self.value = value
        self.next = next
    }
}
extension Node :CustomStringConvertible {
    
    var description :String {
        
        guard let next = next else {
            return "\(String(describing: value))"
        }
        
        return "\(value) -> " + String(describing: next) + " "
    }
    
}


//Link Lists

class LinkList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    //MARK: Append
    func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
    }
        tail?.next = Node(value, nil)
        tail = tail?.next
    }
    
    //MARK: push
    func push(_ value: Value) {
    
         head = Node.init(value, head)
        if tail == nil {
            tail = head
        }
    }
    
    //MARK: Pop
    
    func pop() {
        head = head?.next
        if isEmpty {
            tail = nil
        }
    }
    
    func nodeAtIndex(index: Int) -> Node<Value>? {
       var currentIndex = 0
        var currentNode = head
        
        while currentIndex < index && currentNode != nil {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
        
        
    }
    
    func removeAfterindex(index: Int) -> String {
        //node at index
        let node = self.nodeAtIndex(index: index)
        guard let node = node else {
          return "Could not remove"
        }
        node.next = node.next?.next
        return "Removed Successfully"
    }

    //Insert
    
    func insert(value: Value, at index: Int) {
        if index == 0 {
            push(value)
        } else {
           //Previous Node
            let node = nodeAtIndex(index: index-1)
            if let node = node {
                node.next = Node.init(value, node.next)
            }
        }
        
    }
    //RemoveLast
    func removeLast() {
      /*  //My way
        var currentNode = head
        var currentIndex = -1
        
        while currentNode != nil {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        print("final current index is \(currentIndex)")
        let prevNode = nodeAtIndex(index: currentIndex-1)
        prevNode?.next = nil
        tail = prevNode */
        
        //Other way
        
        
    }
    
}
extension LinkList :CustomStringConvertible {
    
    var description :String {
        
        guard let head = head else {
            return "Empty List"
        }
        
        return String(describing: head)
        
    }
    
}




let linkList = LinkList<Int>()

print("Link list is\(linkList)")

linkList.append(1)
linkList.append(2)

print("Link list after append is\(linkList)")
linkList.push(5)
print("Link list after append is\(linkList)")
linkList.pop()
print("Link list after pop is\(linkList)")

print("Node at index 1 is\(linkList.nodeAtIndex(index:1))")
linkList.removeAfterindex(index: 0)
print("Link list after removing  is\(linkList)")
linkList.insert(value: 2, at: 1)
print("Link list after inserting  is\(linkList)")
linkList.insert(value: 7, at: 1)
print("Link list after inserting  is\(linkList)")
linkList.insert(value: 8, at: 1)
print("Link list after inserting  is\(linkList)")
linkList.removeLast()
print("Link list after removing last  is\(linkList)")
