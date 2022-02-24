//
//  main.swift
//  LeetCodeLena
//
//  Created by Lena on 2/2/22.
//

import Foundation

class Solution {
  func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    guard nums.count >= 4 else { return [] }
    
    var result = [[Int]]()
    let sorted = nums.sorted(by: <)
    
    for i in 0..<sorted.count - 3 {
      if i != 0 && sorted[i] == sorted[i - 1] { continue }
      let first = sorted[i]
      let rest = Array(sorted[(i + 1)..<sorted.count])
      
      for j in 0..<rest.count {
        if j != 0 && rest[j] == rest[j - 1] { continue }
        let second = rest[j]
        var k = j + 1
        var p = rest.count - 1
        let twoSum = target - (first + second)
        while k < p {
          if rest[k] + rest[p] == twoSum {
            result.append([first, second, rest[k], rest[p]])
            k += 1
            while k < p, rest[k] == rest[k - 1] {
              k += 1
            }
          } else if rest[k] + rest[p] < twoSum {
            k += 1
            while k < p, rest[k] == rest[k - 1] {
              k += 1
            }
          } else if rest[k] + rest[p] > twoSum {
            p -= 1
            while k < p, rest[p] == rest[p + 1] {
              p -= 1
            }
          }
        }
      }
    }
    return result
  }
}

let sol = Solution()
print(sol.fourSum([-2,-1,-1,1,1,2,2], 0))
