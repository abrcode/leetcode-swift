//
//  ContainsDuplicate.swift
//  
//
//  Created by Aniket Rao on 03/01/23.
//

import Foundation

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        
        var dict : [Int:Bool] = [:]
        
        for num  in nums {
            if dict[num] != nil {
                return true
            } else {
                dict[num] = false
            }
        }
        return false
    }
}
