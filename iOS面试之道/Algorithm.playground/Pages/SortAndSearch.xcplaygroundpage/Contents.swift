//: [Previous](@previous)

import Foundation

// SortAndSearch

extension Array {
	func indexForInsertingObject(object: AnyObject, compare: (_ a: AnyObject, _ b: AnyObject) -> Int) -> Int {
		var left = 0
		var right = self.count - 1
		var mid = 0

		while left < right {
			mid = (right - left) / 2 + left

			if compare(self[mid] as AnyObject, object) < 0 {
				left = mid + 1
			} else {
				right = mid
			}
		}

		return mid
	}
}

public class News: NSObject {
	public var time: Int
	public init(_ time: Int) {
		self.time = time
	}

	public func compareDate(_ news: News) -> Int {
		self.time - news.time
	}
}

let news1 = News(1)
let news2 = News(3)
let news3 = News(6)
let news4 = News(9)
let news5 = News(12)
let news6 = News(16)

var arr = [news1, news2, news3, news4, news5, news6]

let insertNews = News(7)
let insertIndex = arr.indexForInsertingObject(object: insertNews) { a, b in
	let newsA = a as! News
	let newsB = b as! News
	return newsA.compareDate(newsB)
}
arr.insert(insertNews, at: insertIndex)
for news: News in arr {
	print("news time = \(news.time)")
}


//: [Next](@next)
