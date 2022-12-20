//
//  TwoSum.swift
//  
//
//  Created by Aniket Rao on 20/12/22.
//

import Foundation


class TwoSumSol {
    
    func twoSum(_ nums : [Int] , _ target : Int) -> [Int] {
        
        var dict : [Int : Int] = [:]
        
        for (index , num ) in nums.enumerated(){
            
            let diff = target - num
            
            if let seconIndex = dict[diff] {
                
                return [ index , seconIndex]
                
            } else {
                
                dict[num] = index
                
            }
        }
        
        return []
    }
    
}
