//
//  Trie.swift
//  BFS&DFS
//
//  Created by 王晟骏 on 2019/11/3.
//  Copyright © 2019 justin. All rights reserved.
//

import Foundation

public class Trie<CollectionType: Collection> where CollectionType.Element: Hashable {

	public typealias Node = TrieNode<CollectionType.Element>

	private let root = Node(key: nil, parent: nil)

	public init() {}

	// insert
	public func insert(_ collection: CollectionType) {
		// 1
		var current = root

		// 2
		for element in collection {
			if current.children[element] == nil {
				current.children[element] = Node(key: element, parent: current)
			}
			current = current.children[element]!
		}

		// 3
		current.isTerminating = true
	}

	// contains
	public func contains(_ collection: CollectionType) -> Bool {
		var current = root
		for element in collection {
			guard let child = current.children[element] else {
				return false
			}
			current = child
		}
		return current.isTerminating
	}

	// remove
	public func remove(_ collection: CollectionType) {
		// 1
		var current = root
		for element in collection {
			guard let child = current.children[element] else {
				return
			}
			current = child
		}
		guard current.isTerminating else {
			return
		}
		// 2
		current.isTerminating = false
		// 3
		while let parent = current.parent, current.children.isEmpty
		&& !current.isTerminating {
			parent.children[current.key!] = nil
			current = parent
		}
	}

}

public extension Trie where CollectionType: RangeReplaceableCollection {

	func hasPrefix(_ prefix: CollectionType) -> Bool {
		// 1
		var current = root
		for element in prefix {
			guard let child = current.children[element] else {
				return false
			}
			current = child
		}
		return true
	}

}
