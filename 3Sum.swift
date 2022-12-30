//
//  3Sum.swift
//  
//
//  Created by Aniket Rao on 30/12/22.
//

import Foundation

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        var result :[[Int]] = []
        
        var sortedArray = nums.sorted()
        
        for (index , number) in sortedArray.enumerated() {
            
            if index > 0 && number == sortedArray[index - 1] {
                continue
            }
            
            
            // Twp Pointer
            var leftPoint = index + 1
            var rightPoint = sortedArray.count - 1
            
            while(leftPoint < rightPoint) {
                
                let sum = number + sortedArray[leftPoint] + sortedArray[rightPoint]
                
                if (sum > 0) {
                    rightPoint -= 1
                } else if (sum < 0) {
                    leftPoint += 1
                } else {
                    result.append([number ,sortedArray[leftPoint] , sortedArray[rightPoint]])
                    leftPoint += 1
                    
                    while rightPoint > leftPoint && leftPoint > 1 && sortedArray[leftPoint - 1] == sortedArray[leftPoint] {
                        leftPoint += 1
                    }
                }
            }
        }
        return result
    }
}
