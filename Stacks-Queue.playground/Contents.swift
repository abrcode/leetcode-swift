import UIKit




// Stack

class Stack<T> {
    
    private var array : [T] = []
    
    
    func push(_ item :T) {
        array.append(item)
    }
    
    func pop() -> T? {
        array.popLast()
    }
    
    func peek() -> T?{
        array.last
    }
    
    var isEmpty : Bool {
        array.isEmpty
    }
    
    var count: Int {
        array.count
    }
}



// Queue

class Queue<T> {
    
    private var array : [T] = []
    
    func enqueue(_ item : T) {
        array.append(item)
    }
    
    func dequeue() -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    var isEmpty : Bool {
        return array.isEmpty
    }
    
    var count : Int {
        return array.count
    }
    
    func peek() -> T? {
        return array.first
    }
}





func rotateArrayWithQueue( _ array :[Int] , k: Int) -> [Int]? {
    
    var array = array
//    [1,2,3,4,5,6,7], k = 3
    
//    guard let <#identifier#> = array.count > o  else { return nil }
    if array.isEmpty {
        return nil
    }
    
    for i in 0..<k {
        let dequeueItem = array.removeFirst()
        array.append(dequeueItem)
    }
    return array
}

print("New queue after left rotation :-> \(rotateArrayWithQueue([1,2,3,4,5,6,7], k: 3))")




// Reverse String

func reverse(_ word : String) -> String {
    
    var resultArray = word
    var stack : [Character] = []
    
    for index in resultArray {
        stack.append(index)
    }
    var newString = ""
    while !stack.isEmpty {
        
        if let lastValue = stack.popLast() {
            newString.append(lastValue)
        }
        
    }
    
    return newString
}

print(" Reverse string using : \(reverse("Hello World"))")


func isValid(_ s: String) -> Bool {

    guard (s.count % 2 == 0) else {
        return false
    }
    
    var stack : [Character] = []
    
    for item in s {
        switch item {
        case "(":
            stack.append(")")
        case "{":
            stack.append("}")
        case "[":
            stack.append("]")
        default:
            if stack.isEmpty || stack.removeLast() != item {
                return false
            }
        }
    }
    return stack.isEmpty
}

//print("Valid parenthasis \(isValid("()[{}"))")



//func decodeString(_ s: String) -> String {
////    Input: s = "3[a]2[bc]"
////    Output: "aaabcbc"
////    Example 2:
////
////    Input: s = "3[a2[c]]"
////    Output: "accaccacc"
////    Example 3:
////
////    Input: s = "2[abc]3[cd]ef"
////    Output: "abcabccdcdcdef"
//    
//    
//    var stack = [Character]()
//    
//    for item in s {
//        
//        if item == "]" {
//            
//            var words = ""
//            var finalString = ""
//            while let last = stack.last , last.isLetter {
//                words = String(last) + words
//                stack.removeLast()
//            }
//            
//            if let last = stack.last , last == "[" {
//                stack.removeLast()
//            }
//            
//            var numStr = ""
//            while let last = stack.last , last.isNumber {
//                numStr = String(last) + numStr
//                stack.removeLast()
//            }
//            
//            for i in 1...(Int(numStr) ?? 0) {
//                finalString += words
//            }
//                
//            
//            stack.append(contentsOf: Array(finalString))
//        } else {
//            stack.append(item)
//        }
//    }
//    
//    print("\(String(stack))")
//    return String(stack)
//}

func decodeString(_ s: String) -> String {

      var stack : [Character] = []
   
      for char in s {
  
        if char == "]"  {

        var wordComb = ""
        var finalString = ""

        while let last = stack.last , last.isLetter {
            wordComb = String(last) + wordComb
            stack.removeLast()
        }
            
            if let last = stack.last , last == "[" {
                stack.removeLast()
            }

        var numString = ""
        while let last = stack.last , last.isNumber {
           numString = String(last) + numString
           stack.removeLast()
        }

        for _ in 1...(Int(numString) ?? 0){
            finalString += wordComb
        }
      
        stack.append(contentsOf : Array(finalString))

        } else {
            stack.append(char)
         }
       }
     
      return String(stack)
    }

print("Decode \(decodeString("3[a]2[bc]"))")
