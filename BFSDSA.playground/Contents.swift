import UIKit
import math_h


class TreeNode  {
    
    var val : Int
    var left : TreeNode?
    var right : TreeNode?
    
    init(_ val: Int ,_ left: TreeNode? = nil ,_ right : TreeNode? = nil){
        self.val = val
        self.left = left
        self.right = right
    }
    
}


/*
  max level sum :- https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree/
 */
func maxLevelSum(_ root: TreeNode?) -> Int {
    
    guard let root = root else { return 0 }
    
    var level = 1
    var maxSumLevel = 1
    var maxSum = Int.min
   
    
    var queue : [TreeNode?] = [root]   //First Element in queue as every nodes stored in Queue (work as FIFO first in first out)
    
    while !queue.isEmpty {
        
        var lvlSize = queue.count // it give you the nom on nodes on current level
        var sum = 0
        
        for _ in 0..<lvlSize{
                    
            let parentNode = queue.removeFirst()
            sum += parentNode?.val ?? 0
            
            if let leftChild = parentNode?.left {
                queue.append(leftChild)
            }
            
            if let rightChild = parentNode?.right {
                queue.append(rightChild)
            }
            
          
        }
        if sum > maxSum {
            maxSumLevel = level
            maxSum = sum
        }
        
        level += 1
    }
    
    return maxSumLevel
}
//print("Max sum level :-> \(maxLevelSum(root))")



/*
 2nd Question :-  Invert a binary Tree :- https://leetcode.com/problems/invert-binary-tree/
 */
func invertTree(_ root: TreeNode?) -> TreeNode? {
    
    guard let root = root else { return nil }
    
    var temp = root.left
    root.left = root.right
    root.right = temp
    
    invertTree(root.left)
    invertTree(root.right)
    
    return root
}


/* 3 :- Diameter of Binary Tree */
func diameterOfBinaryTree(_ root: TreeNode?) -> Int {

    guard let root = root else { return 0 }
    
    var result = 0
    
    dfs(root, &result)
    
    return result
}

func dfs(_ head : TreeNode?, _ result : inout Int) -> Int {
    print("root -> \(head)")
    guard let head = head else { return 0}
    
    let leftHeight = dfs(head.left, &result)
    let rightHeight = dfs(head.right , &result)
    
    result = max(result , leftHeight + rightHeight)
    
    return 1 + max(leftHeight, rightHeight)
}

//print(" Diameter :-> \(diameterOfBinaryTree(root))")

