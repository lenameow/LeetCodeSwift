// Divide and conquer. l & r will merge at last.

class Solution {
  func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var l = 0
    var r = nums.count - 1
    while l < r {
      let m = (l + r) / 2
      if target <= nums[m] {
        r = m
      } else {
        l = m + 1
      }
    }

    if target <= nums[l] {
      return l
    } else {
      return nums.count
    }
  }
}
