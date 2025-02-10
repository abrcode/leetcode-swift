import UIKit


public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }



/*
  Balanced binary tree :- https://leetcode.com/problems/balanced-binary-tree/description/
 */

func isBalanced(_ root: TreeNode?) -> Bool {
 
    guard let root = root else { return true }
    
    
    if !isBalanced(root) || !isBalanced(root) {
        return false
    }
    
    
    func val(_ head : TreeNode?) -> Int {
        
        guard let head = head else { return -1 }

        return 1 + max(val(head.left), val(head.right))
        
    }
    
    return abs(val(root.left) - val(root.right)) <= 1
    
}

let root = TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(2, nil, TreeNode(4)))
print("Balance Tree :->  \(isBalanced(root))")


/*
 Lowest common ancestor :- https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/description/
 */

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    
    guard let root = root else { return nil }
    
    if root.val == p?.val || root.val == q?.val {
        return root
    }
    
    let leftN = lowestCommonAncestor(root.left, p, q)
    let rightN = lowestCommonAncestor(root.right, p, q)
    
    if leftN?.val != nil && rightN?.val != nil {
        return root
    }
    
    if leftN != nil && rightN == nil  {
        return leftN
    }
    
    return rightN
    
}


