//
//  ViewController.swift
//  BFS&DFS
//
//  Created by 王晟骏 on 2019/11/2.
//  Copyright © 2019 justin. All rights reserved.
//

import UIKit

/// 实现一个查找单词App：给定一个初始字母矩阵，可以从任意一个字母开始，从任意方向，选择任意长度，选出其中所有单词

class ViewController: UIViewController {

	let matrix: [[Character]] = [
		["A", "S", "A", "P", "D", "P", "R", "Q", "M", "A", "H"],
		["G", "N", "I", "M", "E", "H", "P", "S", "A", "L", "B"],
		["G", "I", "F", "S", "Z", "E", "L", "D", "D", "Y", "D"],
		["W", "S", "S", "C", "Y", "X", "F", "W", "E", "Z", "Z"],
		["X", "E", "M", "D", "L", "T", "O", "A", "A", "I", "T"],
		["V", "V", "O", "V", "A", "I", "N", "B", "H", "D", "Q"],
		["Z", "I", "Y", "G", "R", "O", "L", "P", "O", "D", "P"],
		["F", "G", "F", "W", "A", "Y", "Y", "U", "L", "Q", "N"],
		["L", "R", "I", "T", "P", "E", "G", "T", "E", "V", "O"],
		["F", "O", "O", "R", "F", "F", "O", "E", "R", "O", "T"],
		["V", "F", "C", "R", "O", "W", "D", "G", "B", "A", "T"],
	]



	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.

		let lines: [UILabel] = Array(repeating: UILabel(), count: matrix[0].count)
		var labels: [[UILabel]] = Array(repeating: lines, count: matrix.count)

		var xOffset: CGFloat = 0
		var yOffset: CGFloat = 0
		let cellWidth = UIScreen.main.bounds.size.width / CGFloat(matrix[0].count)
		let cellHeight = UIScreen.main.bounds.size.height / CGFloat(matrix.count)

		for i in 0..<matrix.count {
			for j in 0..<matrix[0].count {
				let label = UILabel(frame: CGRect(x: xOffset, y: yOffset, width: cellWidth, height: cellHeight))
				label.text = "\(matrix[i][j])"
				view.addSubview(label)
				labels[i][j] = label
				xOffset += cellWidth
			}
			xOffset = 0
			yOffset += cellHeight
		}

	}

	func searchWord(_ board: [[Character]]) -> Bool {
		guard board.count > 0 && board[0].count > 0 else {
			return false
		}

		let (m, n) = (board.count, board[0].count)
		var visited = Array(repeating: Array(repeating: false, count: n), count: m)
		let wordContent = [Character]("crowd")

		for i in 0..<m {
			for j in 0..<n {
				if dfs(board, wordContent, m, n, i, j, &visited, 0) {
					return true
				}
			}
		}

		return false
	}

	func dfs(_ board: [[Character]],
			 _ wordContent: [Character],
			 _ m: Int,
			 _ n: Int,
			 _ i: Int,
			 _ j: Int,
			 _ visited: inout [[Bool]],
			 _ index: Int) -> Bool {
		if index == wordContent.count {
			return true
		}

		guard i >= 0 && i < m && j >= 0 && j < n else {
			return false
		}

		guard !visited[i][j] && board[i][j] == wordContent[index] else {
			return false
		}

		visited[i][j] = true

		if dfs(board, wordContent, m, n, i + 1, j, &visited, index + 1)
			|| dfs(board, wordContent, m, n, i - 1, j, &visited, index + 1)
			|| dfs(board, wordContent, m, n, i, j + 1, &visited, index + 1)
			|| dfs(board, wordContent, m, n, i, j - 1, &visited, index + 1) {
			return true
		}

		visited[i][j] = false
		return false
	}


}

