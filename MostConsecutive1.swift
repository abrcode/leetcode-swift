//
//  MostConsecutive1.swift
//  
//
//  Created by Aniket Rao on 03/01/23.
//

import Foundation

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        //nums = [1,0,1,1,1]
        
        guard nums.count > 0 else { return 0 }
        
        var maxOne = 0
        var countOne = 0
        
        
        for num in nums {
            
            if num == 1 {
                countOne += 1
                maxOne = max(maxOne , countOne)
            } else {
                countOne = 0
            }
        }
        return maxOne
    }
}
