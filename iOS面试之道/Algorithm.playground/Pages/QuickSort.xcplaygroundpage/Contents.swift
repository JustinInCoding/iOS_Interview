//: [Previous](@previous)

import Foundation

func quickSort(_ array: [Int]) -> [Int] {
	guard array.count > 1 else {
		return array
	}

	let anchor = array.count / 2
	let leftArray = array.filter() {
		return $0 < array[anchor]
	}

	let middle = array.filter() {
		return $0 == array[anchor]
	}

	let rightArray = array.filter() {
		return $0 > array[anchor]
	}

	return quickSort(leftArray) + middle + quickSort(rightArray)

}

let arr = [2, 5, 8, 1, 6, 0, 9]
let result = quickSort(arr)
print("result = \(result)")

//: [Next](@next)
