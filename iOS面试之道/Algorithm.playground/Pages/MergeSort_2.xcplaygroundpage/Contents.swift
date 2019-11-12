//: [Previous](@previous)

import Foundation

func mergeSort(_ array: [Int]) -> [Int] {
	guard array.count > 1 else {
		return array
	}
	let middleIndex = array.count / 2
	let left = mergeSort(Array(array[0..<middleIndex]))
	let right = mergeSort(Array(array[middleIndex..<array.count]))
	return merge(left, right)
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
	var lIndex = 0, rIndex = 0
	var arr: [Int] = Array()
	while lIndex < left.count || rIndex < right.count {
		if lIndex < left.count && rIndex < right.count {
			if left[lIndex] <= right[rIndex] {
				arr.append(left[lIndex])
				lIndex += 1
			} else {
				arr.append(right[rIndex])
				rIndex += 1
			}
		} else if lIndex < left.count {
			arr.append(left[lIndex])
			lIndex += 1
		} else {
			arr.append(right[rIndex])
			rIndex += 1
		}
	}
	return arr
}

let arr = [3, 6, 8, 1, 6, 2]
let result = mergeSort(arr)
print("result = \(result)")

//: [Next](@next)
