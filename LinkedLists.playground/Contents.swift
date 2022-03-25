import UIKit

var greeting = "Hello, playground"

class LinkList
{
    var head: ListNode?
    var tail: ListNode?
    
    var isEmpty: Bool {
        return head == nil
    }
    func append(_ value: Int) {
        print("Append Called")
        guard !isEmpty else {
            push(value)
            return
    }
     
        print("tail is : \(tail?.val)")
        tail?.next = ListNode(value, nil)
        tail = tail?.next
    }
    
    func push(_ value: Int) {
         head = ListNode.init(value, head)
        if tail == nil {
            tail = head
        }
    }
}

 public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }
 
class Solution {
    var finalList: ListNode?
    var currentl1: ListNode?
    var currentl2: ListNode?
    var carry = 0
    var firstValue = 0
    var secondValue = 0
    var valueToAdd = 0
    var tempNode: ListNode?
    var linkList: LinkList?
   
    
    func traverseBothNodes(_ node1: ListNode?, _ node2: ListNode?) {
       
        var mynode1 = node1
        var mynode2 = node2
        
        var finalNode: ListNode?
        var currentNode: ListNode? = mynode1
        var indexes1 = -1
        var indexes2 = -1
        while currentNode != nil {
            currentNode = currentNode?.next
            indexes1 += 1
        }
        
        var currentNode2: ListNode? = mynode2
        while currentNode2 != nil {
            currentNode2 = currentNode2?.next
            indexes2 += 1
        }
        print("Total elements in node 1 are: \(indexes1+1) and in node 2 are: \(indexes2+1) ")
        var totalRuns = 0
       // indexes1 > indexes2 ? totalRuns = indexes1+1 : totalRuns = indexes2+1
        if indexes1 > indexes2 {
            totalRuns = indexes1 + 1
        } else {
            totalRuns = indexes2 + 1
        }
        var currentRuns = 0
        while currentRuns < totalRuns {
            firstValue = 0
            secondValue = 0
            if let mynode1 = mynode1 {
                firstValue = mynode1.val
            } else {
                firstValue = 0
            }
            
            if let mynode2 = mynode2 {
                secondValue = mynode2.val
            } else {
                secondValue = 0
            }
            
            if firstValue + secondValue + carry > 9 {
                valueToAdd = (firstValue + secondValue + carry) % 10
               
            } else {
               
                valueToAdd = firstValue + secondValue + carry
            }
             
            // add in the final node
            
            if linkList == nil {
               print("Link list created")
                linkList = LinkList()
                linkList?.push(valueToAdd)
                
            } else {
                linkList?.append(valueToAdd)
            }

            if firstValue + secondValue + carry > 9 {
                carry = 1
                
            } else {
                carry = 0
               
            }
            mynode1 = mynode1?.next
            mynode2 = mynode2?.next
            currentRuns += 1
        }
        if carry != 0 {
            linkList?.append(1)
        }
        var currentNodeP = linkList?.head
        var finallist = [Int]()
        while currentNodeP != nil {
            print("current node value is : \(currentNodeP?.val) and next is \(currentNodeP?.next?.val)")
            finallist.append(currentNodeP!.val)
            currentNodeP = currentNodeP?.next
        }
        print("Final list is: \(linkList?.head)")
    }
    
   
}

//List 1
var list1 = ListNode.init(6)
list1.next = ListNode.init(8)
list1.next?.next = ListNode(5)


//List 2
var list2 = ListNode.init(1)
list2.next = ListNode.init(2)
list2.next?.next = ListNode(4)
list2.next?.next?.next = ListNode(4)
//Solution().addTwoNumbers(list1, list2)
Solution().traverseBothNodes(list1, list2)
