//: [Previous](@previous)

import Foundation

/// No good
//func binarySearch(_ array: [Int], _ target: Int) -> Bool {
//	guard array.count > 0 else {
//		return false
//	}
//
//	let middle = array.count / 2
//	if array[middle] < target {
//		return binarySearch(Array(array[0..<middle]), target)
//	} else if array[middle] == target {
//		return true
//	} else {
//		return binarySearch(Array(array[middle + 1..<array.count]), target)
//	}
//}

/// 1. while
func binarySearch(_ array: [Int], _ target: Int) -> Bool {
	var left = 0, right = array.count - 1, middle = 0
	while left <= right {
		middle = (right - left) / 2 + left
		if target == array[middle] {
			return true
		} else if target < array[middle] {
			right = middle - 1
		} else {
			left = middle + 1
		}
	}
	return false
}

/// 2. recursion
func binarySearch_2(_ array: [Int], _ target: Int) -> Bool {
	return binarySearch_2(array, target, 0, array.count - 1)
}

func binarySearch_2(_ array: [Int], _ target: Int, _ left: Int, _ right: Int) -> Bool {
	guard left <= right else {
		return false
	}

	let middle = (right - left) / 2 + left
	if target == array[middle] {
		return true
	} else if target < array[middle] {
		return binarySearch_2(array, target, left, middle - 1)
	} else {
		return binarySearch_2(array, target, middle + 1, right)
	}

}

let arr = [1, 2, 3, 4, 5, 6]
let result = binarySearch_2(arr, 4)
print("result = \(result)")

//: [Next](@next)
