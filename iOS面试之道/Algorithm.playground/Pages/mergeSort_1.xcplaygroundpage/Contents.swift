//: [Previous](@previous)

import Foundation

// 归并排序
func mergeSort(_ array: [Int]) -> [Int] {
	var helper = Array(repeating: 0, count: array.count), arr = array
	mergeSort(&arr, &helper, 0, arr.count - 1)
	return arr
}

func mergeSort(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ high: Int) {
	guard low < high else {
		return
	}
	let mid = (high - low) / 2 + low
	mergeSort(&array, &helper, low, mid)
	mergeSort(&array, &helper, mid + 1, high)
	merge(&array, &helper, low, mid, high)
}

func merge(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ middle: Int, _ high: Int) {
	for i in low...high {
		helper[i] = array[i]
	}

	var helperLeft = low, helperRight = middle + 1, current = low

	while helperLeft <= middle && helperRight <= high {
		if helper[helperLeft] <= helper[helperRight] {
			array[current] = helper[helperLeft]
			helperLeft += 1
		} else {
			array[current] = helper[helperRight]
			helperRight += 1
		}
		current += 1
	}

	guard middle - helperLeft >= 0 else {
		return
	}
	for i in 0...middle - helperLeft {
		array[current + i] = helper[helperLeft + i]
	}
}

let array = [1, 4, 3, 8, 7]
let sortedArr = mergeSort(array)
print("sortedArr = \(sortedArr)")

//: [Next](@next)
