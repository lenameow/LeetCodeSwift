class Solution {
  func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 0 else { return [-1, -1] }
    
    // Divide and conquer
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
    
    if target != nums[l] {
      return [-1, -1]
    } else {
      var lo = l
      var hi = l
      while lo >= 1 && nums[lo] == nums[lo - 1] {
        lo -= 1
      }
      while hi <= nums.count - 2 && nums[hi] == nums[hi + 1] {
        hi += 1
      }
      return [lo, hi]
    }
  }
}
