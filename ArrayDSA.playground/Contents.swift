import UIKit


/*
   _
  /_\  _ _ _ _ __ _ _  _ ___
 / _ \| '_| '_/ _` | || (_-<
/_/ \_\_| |_| \__,_|\_, /__/
                    |__/
 */



/*
   Binary Search Tree :-  O(log n)
*/
 
func binarySearchTree(_ array : [Int], element : Int) -> Bool {
    
    var firstIndex = 0
    var lastIndex = array.count - 1
    
    //var index = -1
    
    while firstIndex <= lastIndex /*&& index == -1 */{
        
        
        var middleIndex = (firstIndex + lastIndex) / 2
        
        if array[middleIndex] == element {
            return true
        } else if array[middleIndex] < element {
            firstIndex = middleIndex + 1
        } else if array[middleIndex] > element{
            lastIndex = middleIndex - 1
        }
        
    }
    return false
    
}
//print("Binary Found:-> \(binarySearchTree([2, 5, 6, 8, 9, 10, 12], element: 12))")



/*
   Brute Force Approach :- O(n)
*/

func commonItemByBrute(_ A: [Int], _ B: [Int]) -> Bool {
    
    
    for itemA in A {
        for itemB in B {
            if itemA == itemB {
                return true
            }
        }
    }
    return false
    
}
//commonItemByBrute([1,2,3], [4,5,6])
//commonItemByBrute([1,2,3], [3,5,6])



/*
    Prooblem Statemnet :- Two Sum
*/

func twoSum(_ array :[ Int] , target : Int) -> [Int] {
    // Tar : 10
    // [1,7,2,3,5,6]
    
    var dict : [Int: Int] = [:]
    
    for (index , num) in array.enumerated() {
        let diff = target - num
        if let otherIndex = dict[diff] {

            return [ otherIndex , index]
            
        } else {
            dict[num] = index
        }
        
    }
    
    return []
}



/*
   Three Sum Problem
*/

func threeSum(_ array : [Int] , target : Int) -> [[Int]] {
    
    var result : [[Int]] = []
    var soretdArray = array.sorted()
    
    for (index, number) in soretdArray.enumerated(){
        
        // If current index value and next inedx value are same
        if index > 0 && soretdArray[index] == soretdArray[index - 1] {
            continue
        }
     
        var leftPoint = index + 1
        var rightPoint = soretdArray.count - 1
        
        while leftPoint < rightPoint {
            
            
            let sum = soretdArray[index] + soretdArray[leftPoint] + soretdArray[rightPoint]
            
            
            if sum < target {
                leftPoint += 1
            } else if sum > target {
                rightPoint -= 1
            } else {
                
                result.append([soretdArray[index] , soretdArray[leftPoint], soretdArray[rightPoint]])
                
                leftPoint += 1
                rightPoint -= 1
                // Skip duplicate left values
                while leftPoint < rightPoint && soretdArray[leftPoint] == soretdArray[leftPoint - 1] {
                    leftPoint += 1
                }
                
                // Skip duplicate right values
                while leftPoint < rightPoint && soretdArray[rightPoint] == soretdArray[rightPoint + 1] {
                    rightPoint -= 1
                }

            }
        }
    }
    return result
}
print("Array : \(threeSum([0,0,0,0], target: 0))")


/*
 Prooblem Statemnet :- Rotate Array by kth time
*/

func rotateArray(_ array : [Int] , K : Int) -> [Int] {
    
    var newArray = array
    for _ in 1...K {
        newArray = rotateOnce(A: newArray)
    }
    
    return newArray
    /*
        var newArray = array
        var counter = 1
    
    
        while counter <= K {
            let value = newArray.removeLast()
            newArray.insert(value, at: 0)
            counter += 1
        }
    */
    
}

func rotateOnce(A: [Int]) -> [Int] {
    
    var newArray: [Int] = A
    
    for i in 0..<A.count-1 {
        newArray[i+1] = A[i]
    }
    
    newArray[0] = A.last!
    
    return newArray
}
//print("New Rotated Array :-> \(rotateArray([1,2,3,4], K: 2))")





/*
  Search Insert Position and if there return position for Sorted Array
*/
  
func searchInsert(_ nums : [Int] , target : Int) -> Int {
    //[1,2,3,5,6,7]
     var left = 0
     var right = nums.count - 1
    
    while left <= right {
    
        let mid = (left + right) / 2
        
        if nums[mid] == target {
            return mid
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return left
}
//searchInsert([1,2,3,5,6,7], target: 4)




/*
   Search in Rotated Sorted Array if found then return index and not found return -1
   Eg :-> [4,5,6,7,1,2,3]
*/

func searchRotatedSortedArray(_ nums : [Int] , target : Int) -> Int {
    // [4,5,6,7,1,2,3,]
    // 6
    
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
    
        let mid = (left + right) / 2
        
        if nums[mid] == target {
            return mid
        }
        
        if nums[left] <= nums[mid] {  // left side of sorted
            
            if nums[mid] >= target && target > nums[left] {
                right = mid - 1
            } else {
                left = mid + 1
            }
            
        } else {  // Right side is sorted
            
            if nums[mid] <= target && target < nums[right] {
                left = mid + 1
            } else {
                right = mid - 1
            }
            
        }
        
    }
    return -1
}
//searchRotatedSortedArray([4,5,6,7,1,2,3], target: 2)




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

//- 1st Non Repeating Char in the Str
//Input: “Koushik” output: o
func nonRepeating() -> Character? {
    
    var string = "Koushik".lowercased()
 
    var characterCount : [Character: Int] = [:]
    
    for character in string {
        print("Character :--> \(character)")
        
        characterCount[character, default: 0] += 1
        
    }
   
    print(" Keys :-> \(characterCount.keys)")
    for character in string {
        

        if characterCount[character] == 1 {
            print("Non Repeting first  :--> \(character)")
            return character
        }
    }
  
    
  return nil
}




//0 1 1 2 3 5 8 13 21
//func fibonaci(value :Int) -> [Int] {
//
//    var series = [0,1]
//    
//    while series.count < value {
//        
//        let next = series[series.count - 1] + series[series.count - 2]
//        
//        series.append(next)
//        
//    }
//    print(series)
//    return series
//}


func fibonaci(value: Int) -> [Int] {
    
    
    // 0,1,1,2,3,5,8
    var series = [0,1]
    
    while series.count < value {
        
        
        series.append(series[series.count - 1] + series[series.count - 2])
        
    
    }
    print(series)
    return series
}

fibonaci(value: 10)


/*
If the n value there in the series print the n value

Else - print the sum of an even number less than that n value in the series

Input: 21 Output: 21

Input: 20 Output: 10
*/

func conditionLogic(n : Int , series : [Int])  {
    
  //    [5, 3, 2, 7, 4, 9]
    
    let sumOfEven = series.filter { ( $0 < n && ($0 % 2) == 0) }.reduce(0,+)
    var sumEven : Int = 0
    for number in series {
        
        if number ==  n {
            print("Value exist in Series")
        } else if (number < n &&  (number % 2 == 0)) {
            sumEven += number
        }
        
    }
    
    print("SumOF Even :-> \(sumOfEven)")
    print("SumEven :-> \(sumEven)")
    
}
//let series = [1, 2, 3, 5, 8, 13, 21, 34]
//print(conditionLogic(n: 5, series: series))


/*
 Find maximum distance betwwen duplicate values
*/

func maxDistance(arr : [Int])  {
    
//    arr[] = {3, 2, 1, 2, 1, 4, 5, 8, 6, 7, 4, 2}
  
    var elementDict : [Int: [Int]] = [:]
    var firstElement = arr[0]
    
    for (index, num) in arr.enumerated() {
        
        if elementDict.keys.contains(num) {
            elementDict[num , default: [index]]
        }
        
        elementDict[num, default: []].append(index)
    }

    for element in elementDict {
        let indexes = element.value
        let diff = (indexes[indexes.count - 1] - indexes[0])
        print("Diff of values :-> \(element.key) is \(diff) ")
    }
}


// Merge Sort
func merge(leftArray : [Int], rightArray :[Int]) -> [Int] {
    
    var sortedArray: [Int] = []
    var left = leftArray
    var right = rightArray
    
    while left.count > 0 && right.count > 0{
        
        if left[0] < right[0] {
            sortedArray.append(left.removeFirst())
        } else {
            sortedArray.append(right.removeFirst())
        }
        
    }
    
    return sortedArray + left + right
}



func mergeSort(unsoretdArray : [Int]) -> [Int] {
    
    guard unsoretdArray.count > 1 else { return unsoretdArray }
    
    
    var middle = unsoretdArray.count / 2
    
    var leftArray = Array(unsoretdArray[0..<middle])
    
    var rightArry = Array(unsoretdArray[middle..<unsoretdArray.count])
   
    return merge(leftArray: mergeSort(unsoretdArray: leftArray), rightArray: mergeSort(unsoretdArray: rightArry))
}

//print("Whole Array :-> \(mergeSort(unsoretdArray: [30,24,56,12,67,89,18,34,7]))")




/*
 Median of Two Sorted Array :->  (Use Merge Sort for make it one)
 */


func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    
    var sortedArray : [Int] = Array(repeating: 0, count: nums1.count + nums2.count)

    var i = 0
    var j = 0
    var k = 0
        
    while j < nums1.count && k < nums2.count {
        
        if nums1[j] < nums2[k] {
            sortedArray[i] = nums1[j]
            j += 1
        } else {
            sortedArray[i] = nums2[k]
            k += 1
        }
        
        i += 1
    }
    
    while j < nums1.count {
        sortedArray[i] = nums1[j]
        i += 1
        j += 1
    }
    
    while k < nums2.count {
        sortedArray[i] = nums2[k]
        i += 1
        k += 1
    }
    
    print("Sorted Array Before :-> \(sortedArray)")
    return sortedArray
}

//print("Sorted Array :-> \(findMedianSortedArrays([1,4,8], [2,3,5,9]))")




func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
    var i = 0
    var j = 0
    var k : Int = 0
    let m = nums1.count
    let n = nums2.count
    
    
    var mergedArray : [Int] = Array(repeating: 0, count: m + n)
    
    while i < m && j < n {
        if nums1[i] < nums2[j] {
            mergedArray[k] = nums1[i]
            i += 1
        } else {
            mergedArray[k] = nums2[j]
            j += 1
        }
        k += 1
    }
    
    while i < m {
        mergedArray[k] = nums1[i]
        i += 1
        k += 1
    }
    
    while j < n {
        mergedArray[k] = nums2[j]
        j += 1
        k += 1
    }
    
    
    if mergedArray.count == (m + n) {
        var numbers = mergedArray.count
        
        if (numbers % 2 != 0) {
            
            let mid = getIndexValue(n: ((numbers + 1)/2), givenArray: mergedArray)
            print("odd")
            return mid
            
        } else {
            print("even")
            let mid = ((getIndexValue(n:  numbers/2, givenArray: mergedArray)) + ( getIndexValue(n: (numbers/2) + 1, givenArray: mergedArray)) ) / 2
            return mid
            
        }
    } else {
        return 0
    }
}

func getIndexValue(n : Int, givenArray : [Int]) -> Double{
    if n > 0 {
        return Double(givenArray[n-1])
    }
    return 0.0
}


print("median of given array :-> \(findMedianSortedArrays([1, 3], [2,4]))")


// Find Mini in Sorted Rotated Array
func findMin(_ nums: [Int]) -> Int {
    
    guard nums.count > 0 else { return 0}
    // [5,1,2,3,4]
    var left = 0
    var right = nums.count - 1
    
    for (index, number) in nums.enumerated(){
        while (left < right) {
            
            var mid = (left + right) / 2
            
            if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
            
        }
    }
    return nums[left]
}

print("Find Min \(findMin([5,1,2,3,4]))")
