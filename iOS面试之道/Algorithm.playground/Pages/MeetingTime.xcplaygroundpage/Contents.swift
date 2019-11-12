//: [Previous](@previous)

import Foundation


/// Facebook, Google, LinkedIn Interview
/// Meeting Time

/// 例如：有一个会议的时间为下午3点到5点，另一个会议f的时间为下午4点到6点，那么合并之后的会议时间是下午3点到6点。

public class MeetingTime {
	public var start: Int
	public var end: Int
	public init(_ start: Int, _ end: Int) {
		self.start = start
		self.end = end
	}
}

func merge(meetingTimes: [MeetingTime]) -> [MeetingTime] {
	// handle special situation
	guard meetingTimes.count > 1 else {
		return meetingTimes
	}

	// sort
	var meetingTimes = meetingTimes.sorted() {
		if $0.start != $1.start {
			return $0.start < $1.start
		} else {
			return $0.end < $1.end
		}
	}

	// new array
	var res = [MeetingTime]()
	res.append(meetingTimes.first!)

	for i in 1..<meetingTimes.count {
		let last = res.last!
		let current = meetingTimes[i]
		if current.start > last.end {
			res.append(current)
		} else {
			last.end = max(last.end, current.end)
		}
	}

	return res
}

let mt1 = MeetingTime(1, 3)
let mt2 = MeetingTime(5, 6)
let mt3 = MeetingTime(4, 7)
let mt4 = MeetingTime(2, 3)

let arr = [mt1, mt2, mt3, mt4]
let result = merge(meetingTimes: arr)
print("result = \(result)")

//: [Next](@next)
