package main

import "fmt"

type nTree struct {
	x, y     int
	children []nTree
}

func (t *nTree) traverse() {
	if t.children == nil || len(t.children) == 0 {
		fmt.Printf("%d %d \n", t.x, t.y)
	} else {
		for i, child := range t.children {
			child.traverse()
			if i == 0 {
				fmt.Printf("%d %d \n", t.x, t.y)
			}
		}
	}
	return
}

func (t *nTree) findPoint(u, v int) bool {
	if t.x == u && t.y == v {
		return true
	}
	if t.children == nil {
		return false
	}
	for _, child := range t.children {
		if child.findPoint(u, v) {
			return true
		}
	}
	return false
}

func main() {
	tree := nTree{2, -3,
		[]nTree{{5, 1, []nTree{{7, 2, nil}}},
			{-3, 4, nil},
			{2, 4, []nTree{{-1, 1, nil},
				{-2, 3, nil}}}}}

	tree.traverse()
	u, v := 5, 5
	if tree.findPoint(u, v) {
		fmt.Printf("Found: %d %d \n", u, v)
	} else {
		fmt.Printf("%d %d does not exist\n", u, v)
	}
}
