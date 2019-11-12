//: [Previous](@previous)

import Foundation

// Fibonacci sequence
// 100
func Fib() -> Int {
    var (prev, current) = (0, 1)
    for _ in 1..<100 {
        (current, prev) = (prev + current, current)
    }
    return current
}

//let result2 = Fib()
//print("result = \(result2)")

func Fib(_ n: Int) -> Int {
    guard n > 0 else {
        return 0
    }
    if n == 1 || n == 2 {
        return 1
    }
    
    return Fib(n - 1) + Fib(n - 2)
}

//let result2 = Fib(6)
//print("result = \(result2)")

// optimization
var nums = Array(repeating: 0, count: 100)
func Fib2(_ n: Int) -> Int {
    guard n > 0 else {
        return 0
    }
    if n == 1 || n == 2 {
        return 1
    }
    if nums[n - 1] != 0 {
        return nums[n - 1]
    }
    nums[n - 1] = Fib2(n - 1) + Fib2(n - 2)
    return nums[n - 1]
}

let result2 = Fib2(50)
print("result = \(result2)")

// distance between two words
func wordDiatance(_ wordA: String, _ wordB: String) -> Int {
    let aChars = Array(wordA), bChars = Array(wordB)
    let aLen = aChars.count, bLen = bChars.count
    
    var dp = Array(repeating: Array(repeating: 0, count: bLen + 1), count: aLen + 1)
    for i in 0...aLen {
        for j in 0...bLen {
            if i == 0 {
                dp[i][j] = j
            } else if j == 0 {
                dp[i][j] = i
            } else if aChars[i - 1] == bChars[j - 1] {
                dp[i][j] = dp[i - 1][j - 1]
            } else {
                dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
            }
        }
    }
    return dp[aLen][bLen]
}

let result = wordDiatance("abd", "abd")
print("distance = \(result)")

//: [Next](@next)
