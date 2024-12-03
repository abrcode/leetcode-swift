import UIKit



/*
 An integer N representing the total amount of money available.

 Goal: Determine the maximum number of chocolates that can be purchased using N rupees, considering the following rule:
 
 Input: N = 15
 Output: 7
 
 Explanation:

 Initially, purchase 5 chocolates using 15 rupees (5 * 3 = 15).
 This leaves 5 empty chocolate wrappers.
 Exchange 3 wrappers for 1 more chocolate.
 Now, there are 3 wrappers (2 from the previous step + 1 from the new chocolate).
 */


func maxChocolate(money: Int, price: Int, wrapperForChocolate : Int ) -> Int {
    
    // Main Choclate by Amount we hold
    var chocolates = ( money / price)
    
    // We can have exact amount of wrapper same as Choclates
    var wrapper = chocolates
    
    
    // So we can got new chocolates by giving 3 choclate wrapper
    while (wrapper >= wrapperForChocolate) {
        
        let newChoclate = (wrapper / wrapperForChocolate)
        chocolates += newChoclate
        
        wrapper = ( wrapper % wrapperForChocolate) + newChoclate
        
    }
    
    return chocolates
}

print("Max choclate :-> \(maxChocolate(money: 30, price: 3, wrapperForChocolate: 3))")








/*
 Find diff between SecondSmallest and SecondLargest from the given array
 
 eg : [5, 3, 2, 7, 4, 9]
 */



func checkDiff() -> Int {
    
    var numbers = [5, 3, 2, 7, 4, 9]
    
    var largest = Int.min
    var secondLargest = Int.min
    
    var smallest =  Int.max
    var secondSmallest =  Int.max
    
    
    
    for number in numbers {
        
        if largest < number {
            secondLargest = largest
            largest = number
        } else if secondLargest < number && secondLargest != largest {
            secondLargest = number
        }
        
        if smallest > number {
            secondSmallest = smallest
            smallest = number
        } else if secondSmallest > number && secondSmallest != smallest {
            secondSmallest = number
        }
        
    }
    
    return (largest - smallest)
}

print("Diff betwen two valyes --> \(checkDiff())")
