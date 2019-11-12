//: [Previous](@previous)

import Foundation

///[3, 4, 5, 3, 3, 3]

func search(nums: [Int], target: Int) -> Int {
	var (left, mid, right) = (0, 0, nums.count - 1)
	while left <= right {
		mid = (right - left) / 2 + left

//		if nums[mid] == target {
//			return mid
//		}

		if nums[left] < nums[mid] {
			if target >= nums[left] && target <= nums[mid] {
				right = mid
			} else {
				left = mid + 1
			}
		} else if nums[left] > nums[mid] {
			if target >= nums[mid] && target <= nums[right] {
				left = mid
			} else {
				right = mid - 1
			}
		} else {
			if target == nums[left] {
				return left
			} else {
				left += 1
			}
		}
	}
	return -1
}

//let result = search(nums: [4, 5, 6, 7, 0, 1, 2], target: 4)
let result = search(nums: [3, 3, 3, 3, 3, 4, 5], target: 3)
print("result = \(result)")

//: [Next](@next)
