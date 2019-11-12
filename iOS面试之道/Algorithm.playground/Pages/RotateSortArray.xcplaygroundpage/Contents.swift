//: [Previous](@previous)

import Foundation

/// Rotate Sorted Array

/// 一个有序数组可能在某个位置旋转了。给定一个目标值，查找并返回这个元素在数组中的位置，如果不存在，则返回-1。假设数组中没有重复值。

/// 例如：[0, 1, 2, 3, 4, 5, 6, 7] -> [4, 5, 6, 7, 0, 1, 2] 4 - 0; 8 - (-1)

func search(nums: [Int], target: Int) -> Int {
	var (left, mid, right) = (0, 0, nums.count - 1)
	while left <= right {
		mid = (right - left) / 2 + left

		if nums[mid] == target {
			return mid
		}

		if nums[left] <= nums[mid] {
			if target >= nums[left] && target < nums[mid] {
				right = mid - 1
			} else {
				left = mid + 1
			}
		} else {
			if target > nums[mid] && target <= nums[right] {
				left = mid + 1
			} else {
				right = mid - 1
			}
		}
	}
	return -1
}

//let result = search(nums: [4, 5, 6, 7, 0, 1, 2], target: 8)
let result = search(nums: [4, 5, 3, 3, 3, 3], target: 3)
print("result = \(result)")

//: [Next](@next)
