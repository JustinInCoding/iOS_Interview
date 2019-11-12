//
//  ViewController.swift
//  BFS&DFS
//
//  Created by 王晟骏 on 2019/11/2.
//  Copyright © 2019 justin. All rights reserved.
//

import UIKit

/// 已知一个由字母构成的二维矩阵，并给定一个字典，选出二维矩阵中所有横向或纵向的单词

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

	let dict: Set<String> = [
		"CROWD",
		"PUTEG",
		"ONLYGOD",
	]

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.

		createBoard()
		let result = searchWord(matrix, dict)
		for str in result {
			print("str = \(str)")
		}

		// test insert and contain
//		let trie = Trie<String>()
//		trie.insert("cute")
//		if trie.contains("cut") {
//			print("cute is in the trie")
//		}

		// test remove
//		let trie = Trie<String>()
//		trie.insert("cut")
//		trie.insert("cute")
//
//		print("\n*** Before removing ***")
//		assert(trie.contains("cut"))
//		print("\"cut\" is in the trie")
//		assert(trie.contains("cute"))
//		print("\"cute\" is in the trie")
//
//		print("\n*** After removing ***")
//		trie.remove("cut")
//		assert(!trie.contains("cut"))
//		assert(trie.contains("cute"))
//		print("\"cute\" is still in the trie")



	}

	func createBoard() {
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

	func convertSetToTrie(_ dict: Set<String>) -> Trie<String> {
		let trie = Trie<String>()
		for str in dict {
			trie.insert(str)
		}
		return trie
	}

	func searchWord(_ board: [[Character]], _ dict: Set<String>) -> [String] {
		var res = [String]()

		guard board.count > 0 && board[0].count > 0 else {
			return res
		}

		let (m, n) = (board.count, board[0].count)

		let trie = convertSetToTrie(dict)
		var visited = Array(repeating: Array(repeating: false, count: n), count: m)

		for i in 0..<m {
			for j in 0..<n {
				dfs(board, m, n, i, j, &visited, &res, trie, "")
			}
		}

		return res
	}

	func dfs(_ board: [[Character]],
			 _ m: Int,
			 _ n: Int,
			 _ i: Int,
			 _ j: Int,
			 _ visited: inout [[Bool]],
			 _ res: inout [String],
			 _ tries: Trie<String>,
			 _ str: String) {

		guard i >= 0 && i < m && j >= 0 && j < n else {
			return
		}

		guard !visited[i][j] else {
			return
		}

		let str = str + "\(board[i][j])"
		guard tries.hasPrefix(str) else {
			return
		}

		if tries.contains(str) && !res.contains(str) {
			res.append(str)
		}

		visited[i][j] = true
		dfs(board, m, n, i + 1, j, &visited, &res, tries, str)
		dfs(board, m, n, i - 1, j, &visited, &res, tries, str)
		dfs(board, m, n, i, j + 1, &visited, &res, tries, str)
		dfs(board, m, n, i, j - 1, &visited, &res, tries, str)
		visited[i][j] = false
	}


}

