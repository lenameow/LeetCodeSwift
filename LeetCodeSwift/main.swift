//
//  main.swift
//  LeetCodeLena
//
//  Created by Lena on 2/2/22.
//

import Foundation

class Solution {
  func search(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 1 {
      if target == nums.first! {
        return 0
      } else {
        return -1
      }
    }
    
    var k = 0
    var i = nums.count - 1
    var start = 0
    var l = 0
    var r = nums.count - 1
    var division = [Int]()
    
    while i >= 1 && nums[i] > nums[i - 1] {
      i -= 1
      k += 1
    }
    
    k += 1
    k = k % (nums.count - 1)
    
    if target > nums[nums.count - k - 1] || target < nums[nums.count - k] {
      return -1
    } else if target < nums.last! {
      division = Array(nums[(k + 1)...])
      start = k + 1
      r = division.count - 1
    } else if target > nums.last! {
      division = Array(nums[...k])
    } else {
      return nums.count - 1
    }
    
    while l <= r {
      let m = (l + r) / 2
      if target == division[m] {
        return start + m
      } else if target > division[m] {
        l = m + 1
      } else {
        r = m - 1
      }
    }
    return -1
  }
}

let sol = Solution()
print(sol.search([1], 0))
