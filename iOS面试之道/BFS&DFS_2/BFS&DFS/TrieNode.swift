//
//  TrieNode.swift
//  BFS&DFS
//
//  Created by 王晟骏 on 2019/11/3.
//  Copyright © 2019 justin. All rights reserved.
//

import Foundation

public class TrieNode<Key: Hashable> {

	// 1
	public var key: Key?

	// 2
	public weak var parent: TrieNode?

	// 3
	public var children: [Key: TrieNode] = [:]

	// 4
	public var isTerminating = false

	public init(key: Key?, parent: TrieNode?) {
		self.key = key
		self.parent = parent
	}

}
