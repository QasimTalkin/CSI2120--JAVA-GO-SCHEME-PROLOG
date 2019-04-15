package main

import (
	"fmt"
	"math"
	"math/rand"
	"sync"
)

type Point struct {
	x float64
	y float64
}

type Triangle struct {
	A Point
	B Point
	C Point
}

type T interface{}

type Stack struct {
	items []T
	lock  sync.RWMutex
}

func NewStack() *Stack {
	return &Stack{}
}

func (s *Stack) Pop() *T {
	s.lock.Lock()
	defer s.lock.Unlock()
	N := len(s.items)
	top := s.items[N-1]
	s.items = s.items[:N-1]
	return &top
}

func (s *Stack) Peek() *T {
	s.lock.Lock()
	defer s.lock.Unlock()
	return &s.items[len(s.items)-1]
}
func (s *Stack) Push(t T) {
	s.lock.Lock()
	defer s.lock.Unlock()
	s.items = append(s.items, t)
}

func distance(pA Point, pB Point) float64 {
	return math.Sqrt(math.Pow((pA.x-pB.x), 2) + math.Pow((pA.y-pB.y), 2))
}

func (t Triangle) Perimeter() float64 {
	return distance(t.A, t.B) + distance(t.B, t.C) + distance(t.A, t.C)
}

func (t Triangle) Area() float64 {
	S := t.Perimeter() / 2.
	sMa := S - distance(t.A, t.B)
	sMb := S - distance(t.B, t.C)
	sMc := S - distance(t.C, t.A)
	return math.Sqrt(S * sMa * sMb * sMc)
}

func classifyTriangle(high *Stack, low *Stack, threshold float64, triangles []Triangle) {
	for _, t := range triangles {
		ratio := t.Perimeter() / t.Area()
		if ratio > threshold {
			high.Push(t)
		} else {
			low.Push(t)
		}
	}
}

func triangles10000() [10000]Triangle {
	var tableau [10000]Triangle
	rand.Seed(2120)
	for i := 0; i < 10000; i++ {
		tableau[i].A = Point{rand.Float64() * 100., rand.Float64() * 100.}
		tableau[i].B = Point{rand.Float64() * 100., rand.Float64() * 100.}
		tableau[i].C = Point{rand.Float64() * 100., rand.Float64() * 100.}
	}
	return tableau
}

func main() {
	thresh := 1.0 //0.25 gives apprx 50%/50% split
	triangles := triangles10000()
	high := NewStack()
	low := NewStack()
	var wg sync.WaitGroup
	interval := len(triangles) / 10
	for i := 0; i < 10; i++ {
		wg.Add(1)
		go func(i int) {
			classifyTriangle(high, low, thresh, triangles[i*interval:(i+1)*interval])
			wg.Done()
		}(i)
	}
	wg.Wait()

	topHigh := (*high.Peek()).(Triangle)
	topLow := (*low.Peek()).(Triangle)
	fmt.Println("Triangle sort ratio used: ", thresh)
	fmt.Println("High Ratio count: ", len(high.items))
	fmt.Println("High Ratio top of pile: ", topHigh)
	fmt.Println("ratio: ", topHigh.Perimeter()/topHigh.Area())
	fmt.Println("Low Ratio count: ", len(low.items))
	fmt.Println("Low Ratio top of pile: ", topLow)
	fmt.Println("ratio: ", topLow.Perimeter()/topLow.Area())
}
