package main

import (
	"fmt"
	"math"
)

type Point struct {
	X float64
	Y float64
}

func Distance(p1 Point, p2 Point) (distance float64) {
	distance = math.Sqrt(math.Pow(p1.X-p2.X, 2.0) + math.Pow(p1.Y-p2.Y, 2.0))
	return
}

type Shape interface {
	Perimeter() float64
	Show()
}

type shape struct {
	Name     string
	Vertices []Point
}

type square struct {
	shape
}

type triangle struct {
	shape
}

/*
func (t *triangle) Perimeter() float64 {
	var sum float64 = 0.0
	for i := 0; i < 3; i++ {
		sum += Distance(t.Vertices[i], t.Vertices[(i+1)%3])
	}
	return sum
}

func (s *square) Perimeter() float64 {
	var sum float64 = 0.0
	for i := 0; i < 4; i++ {
		sum += Distance(s.Vertices[i], s.Vertices[(i+1)%4])
	}
	return sum
}

func (t *triangle) Show() {
	fmt.Printf("%s : ", t.Name)
	fmt.Println(t.Vertices)
}

func (s *square) Show() {
	fmt.Printf("%s : ", s.Name)
	fmt.Println(s.Vertices)
}
*/

func (s *shape) Perimeter() float64 {
	var sum float64 = 0.0
	for i := 0; i < len(s.Vertices); i++ {
		sum += Distance(s.Vertices[i], s.Vertices[(i+1)%len(s.Vertices)])
	}
	return sum
}

func (s *shape) Show() {
	fmt.Printf("%s : ", s.Name)
	fmt.Println(s.Vertices)
}

func NewSquare(pts [4]Point) Shape {
	return &square{
		shape: shape{Name: "Square", Vertices: pts[:]},
	}
}

func NewTriangle(pts [3]Point) Shape {
	return &triangle{
		shape: shape{Name: "Triangle", Vertices: pts[0:]},
	}
}

func main() {
	ptsT := [...]Point{{0, 0}, {1.0, 3.5}, {0.5, 5.1}}
	ptsS := [...]Point{{-10, 0.5}, {-8, 1.5}, {-9, 3.5}, {-11, 2.5}}
	//	fmt.Println(Distance(ptsT[1], ptsT[0]))
	// s := NewSquare(ptsS)
	// fmt.Println(s.Perimeter())
	var collection [2]Shape
	collection = [2]Shape{NewSquare(ptsS), NewTriangle(ptsT)}
	for _, s := range collection {
		s.Show()
		p := s.Perimeter()
		fmt.Printf("Perimeter %f\n", p)
	}
}
