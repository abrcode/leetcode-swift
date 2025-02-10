import UIKit



// A linked list is simply a node with a pointer to next
//class Node {
//    
//    var data : Int
//    var next : Node?
//    
//    init(data: Int, next: Node? = nil) {
//        self.data = data
//        self.next = next
//    }
//    
//}


class Node <T> {
    var data : T
    var next : Node?
    
    init(_ data: T,_ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

// Example for showing linked lisy
extension Node : CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "[\(data)]"
        }
        return "[\(data)] --> " + String(describing: next) + " "
    }
}

// Pring linked list by walking each node
func printLinkedListNode<T>(_ head : Node<T>?){
    
    if head == nil {
        return
    }                                      //  head -> [1] -> [2] -> [3] -> nil
    
    var node = head
    print(node!.data)
    
    while node?.next != nil {
        print(node!.next!.data)
        node = node?.next
    }
}


// Skeleton Of Linked List

class LinkedList<T> {
    
    private var head : Node<T>?
   
    
    // Add New Value on Front
    func addFront(_ data : T) {
        
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }
    
    // Get a Front Value
    func getFirstValue() -> T?{
        if head == nil {
            return nil
        }
       
        return head!.data
    }
    
    // Add Node To Back Side
    func addNodeToBack(_ data : T){
        
        var newNode = Node(data)
        
        if head == nil {
            return
        }
        
        var node = head
        
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = newNode
    }
    
    
    // Get Last Node of Linked List
    func getLastNode() -> T? {
        
        if head == nil {
            return nil
        }
        
        var node = head

        while node?.next != nil {
            node = node?.next
        }
        return node!.data
    }
    
    
    // Insert node at specific posistin
    func insert(position: Int , data: T) {
        
        if position == 0 {
            addFront(data)
            return
        }
 
        var newNode = Node(data)
        var currentNode = head
        // (3, 9)
        //li 1 2 5 7 3 1
        // i 0 1 2 3 4 5
        for _ in 0...position-1 {
            currentNode = currentNode?.next
        }
        
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
 

    //Dlete First
    func deleteFirst() {
        head = head?.next
    }
    
    
    // Dlete Last Node
    func deleteLastNode() {
        
        var previousNode : Node<T>?
        var node = head
        
        while node?.next != nil {
            previousNode = node
            node = node?.next
        }
        previousNode?.next = nil
    }
    
    
    func deleteNodeAt(position : Int) {
        if position == 0 {
            self.deleteFirst()
            return
        }
        
        var previousNode : Node<T>?
        var nextNode = head
        
        for _ in 0...position-1{
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        
        previousNode?.next = nextNode?.next
        nextNode = nil
    }
    
    
    var isEmpty : Bool {
        return head == nil
    }

    func isClear() {
        head = nil
    }
    
    func printLinkedList(){
        
        if head == nil {
            return
        }
        
        var result = [T]()
        var node = head
        result.append(node!.data)

        while node?.next != nil {
            
            result.append(node!.next!.data)
            node = node!.next
        }
            
        print(result)
    }

}

//let node3 = Node( 3)
//let node2 = Node( 2, node3)
//let node1 = Node(1, node2)

//printLinkedList(node1)
//print(" Actual Representation :->  \(node1.description)")

//let linkedList = LinkedList<Int>()
//linkedList.addFront(3)
//linkedList.addFront(2)
//linkedList.addFront(1)
//
////linkedList.printLinkedList()
////
//linkedList.addFront(4)
////linkedList.printLinkedList()
////
//linkedList.addNodeToBack(8)
//linkedList.addNodeToBack(6)
//
//linkedList.printLinkedList()
//
//linkedList.getFirstValue()
//linkedList.getLastNode()
//
//linkedList.printLinkedList()
//
//
//linkedList.insert(position: 4, data: 9)
//
//linkedList.printLinkedList()
//
//
//linkedList.deleteFirst()
//
//linkedList.printLinkedList()

//linkedList.deleteFirst()
//
//linkedList.deleteLastNode()
//linkedList.printLinkedList()
//
//linkedList.deleteNodeAt(position: 4)
//linkedList.printLinkedList()
//
//
//print(linkedList.isEmpty)
//
//linkedList.isClear()
//
//print("List is :-> \(linkedList.printLinkedList())")
//





// Func for get length of LInked list

func length(_ head : Node<Int>?) -> Int {
    
    var currentCount = 0
    if head == nil {
        return currentCount
    }
    var node = head

    while node != nil {
        node = node!.next
        currentCount += 1
    }

    return currentCount
}


let node6 = Node(6)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node( 3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)



print(length(nil))

print(length(node1))

