//
//  BuyAndSellStock.swift
//  
//
//  Created by Aniket Rao on 03/01/23.
//

import Foundation


class Solution {
    
    func maxProfit(_ prices: [Int]) -> Int {
        
        // prices = [7,1,5,3,6,4]
        
        guard prices.count > 0 else { return 0 }
        
        var maxProfit : Int = 0
        var buyStock : Int = prices[0]
        
        for i in 1..<prices.count {
            
            //If purchased stocks value is greater than next stock
            if  buyStock  > prices[i] {
                buyStock = prices[i]
            }
            
            // If maxProfit is greater then will change it
            if (prices[i] - buyStock) > maxProfit {
                maxProfit = prices[i] - buyStock
            }
        }
        return maxProfit
    }
}
