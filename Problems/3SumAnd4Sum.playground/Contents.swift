import Cocoa

class Solution {
  
  func threeSum(_ nums: [Int]) -> [[Int]] {
      guard nums.count >= 3 else { return [[Int]]() }
      let sorted = nums.sorted()
      var result = [[Int]]()
      for i in 0..<sorted.count {
          // Don't allow `i` to point to same element
          if i != 0, sorted[i] == sorted[i-1] { continue }
          var j = i + 1
          var k = sorted.count-1
          while j < k {
              let sum = sorted[i] + sorted[j] + sorted[k]
              if sum == 0 {
                  result.append([sorted[i], sorted[j], sorted[k]])
                  j += 1
                  // Don't allow `j` to point to same element
                  while j < k, sorted[j] == sorted[j-1] {
                      j += 1
                  }
              } else if sum < 0 {
                  j += 1
              } else {
                  k -= 1
              }
          }
      }
      return result
  }
  
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
          } else if rest[k] + rest[p] > twoSum {
            p -= 1
          }
        }
      }
    }
    return result
  }
}
