//
//  MajorityElement.swift
//  
//
//  Created by Aniket Rao on 08/01/23.
//

import Foundation


class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
    
        
        //Boyers Moore
        guard nums.count >  0 else {return 0}
        
        var max : Int = 0
        var count : Int = 0
        
        for num in nums {
            
            if count == 0 {
                max = num
            }
            
            if max == num {
                count += 1
            } else {
                count -= 1
            }
            
        }
        return max
    }
}
