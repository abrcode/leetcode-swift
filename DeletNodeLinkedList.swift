//
//  File.swift
//  
//
//  Created by Aniket Rao on 29/12/22.
//

import Foundation

/*
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func deleteNode(_ node: ListNode?) {
        guard let node = node else { return }
        if let next = node.next {
            node.val = next.val
            node.next = next.next
        }
    }
}
