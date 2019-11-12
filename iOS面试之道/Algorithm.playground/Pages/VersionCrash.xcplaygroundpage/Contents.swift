//: [Previous](@previous)

import Foundation

/// Version Crash

/// 有一个产品发布了多个版本。它遵循以下规律：假如某个版本崩溃了，则后面的所有版本都会崩溃。
/// 举一个例子：一个产品假如有5个版本，其中第1～3版都是正常的，但是第4个版本崩溃了。那么第5个版本（最新版本）一定也会崩溃。第4个版本被称为第一个崩溃的版本
/// 现在已知一个产品有n个版本，而且有一个检测算法func isBadVersion(version: Int) -> Bool可以判断一个版本是否崩溃。假设这个产品的最新版本崩溃了，求第一个崩溃的版本

/// 假设所有版本是一个数组[1, 2, 3, 4, 5, .... n]

func isBadVersion(version: Int) -> Bool {
	if version <= 7 {
		return false
	}
	return true
}

func findFirstBadVersion(version n: Int) -> Int {
	guard n >= 1 else {
		return -1
	}

	var left = 1, right = n
	var middle = left

	while left < right {
		middle = (right - left) / 2 + left
		if isBadVersion(version: middle) {
			right = middle
		} else {
			left = middle + 1
		}
	}

	return left
}

let res = findFirstBadVersion(version: 10)
print("res = \(res)")

//: [Next](@next)
