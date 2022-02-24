class Solution {
  func nextPermutation(_ nums: inout [Int]) {
    guard nums.count != 1 else { return }
    var i = nums.count - 2
    while i >= 0 && nums[i + 1] <= nums[i] { i -= 1 }
    
    if i == -1 {
      nums.sort()
      return
    }
    
    var j = nums.count - 1
    while j >= 0 && nums[j] <= nums[i] { j -= 1 }
    (nums[i], nums[j]) = (nums[j], nums[i])
    
    reverse(&nums, i + 1)
  }
  
  func reverse(_ nums: inout [Int], _ start: Int) {
    var r = nums.count - 1
    var l = start
    while r > l {
      (nums[l], nums[r]) = (nums[r], nums[l])
      r -= 1
      l += 1
    }
  }
}

let sol = Solution()
var nums = [9, 2, 3, 4, 3, 6, 8]
sol.nextPermutation(&nums)
print(nums)
