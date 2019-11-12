//: [Previous](@previous)

import Foundation

// DFS

class Node {
	var value: Int
	var visited: Bool
	var neighbours: [Node] = []

	init(_ value: Int) {
		self.value = value
		self.visited = false
	}
}

func visit(_ node: Node) {
	print("\(node.value)")
}

func dfs(node: Node?) {
	guard let node = node else {
		return
	}

	visit(node)
	node.visited = true

	for smallNode: Node in node.neighbours {
		if !smallNode.visited {
			dfs(node: smallNode)
		}
	}
}

func bfs(node: Node?) {
	guard let node = node else {
		return
	}

	var queue: [Node] = [node]

	while queue.count > 0 {

		let node = queue.removeFirst()
		visit(node)
		node.visited = true

		for smallNode: Node in node.neighbours {
			if !smallNode.visited {
				queue.append(smallNode)
			}
		}
	}

}

var node_1 = Node(1)

var node_2 = Node(2)
var node_5 = Node(5)
var node_6 = Node(6)
var node_9 = Node(9)

var node_3 = Node(3)
var node_4 = Node(4)

var node_7 = Node(7)

var node_10 = Node(10)

var node_8 = Node(8)

node_1.neighbours = [node_2, node_5, node_6, node_9]
node_2.neighbours = [node_3, node_4]

node_6.neighbours = [node_7]

node_9.neighbours = [node_10]

node_7.neighbours = [node_8]

//dfs(node: node_1)
bfs(node: node_1)

//: [Next](@next)
