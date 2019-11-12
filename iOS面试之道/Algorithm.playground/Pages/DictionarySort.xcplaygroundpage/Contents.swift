//: [Previous](@previous)

import Foundation

func dictionarySort(_ dictionary: Dictionary<String, String>) -> Array<String> {
	let keys = Array(dictionary.keys)
	let sortedKeys = keys.sorted() {
		return dictionary[$0]! > dictionary[$1]!
	}
	return sortedKeys
}

let map = [
	"1" : "4",
	"2" : "3",
	"3" : "2",
	"4" : "1",
]
let result = dictionarySort(map)
print("result = \(result)")

//: [Next](@next)
