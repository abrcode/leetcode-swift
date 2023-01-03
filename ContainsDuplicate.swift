//
//  ContainsDuplicate.swift
//  
//
//  Created by Aniket Rao on 03/01/23.
//

import Foundation

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        
        
        // 1st Approach using Dictinory
        var dict : [Int:Bool] = [:]
        
        for num  in nums {
            if dict[num] != nil {
                return true
            } else {
                dict[num] = false
            }
        }
        return false
        
        
        
        //2nd Approch using set
        
        return Set(nums).count != nums.count
        
        
    }
}
