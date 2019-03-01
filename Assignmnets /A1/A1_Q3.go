package main

import (
	"fmt"
	"math"
	"math/rand"
)

//Point Str
type Point struct {
	x float64
	y float64
}

//Triangle str
type Triangle struct {
	A Point
	B Point
	C Point
}

func triangles10000() (result [10000]Triangle) {
	rand.Seed(2120)
	for i := 0; i < 10000; i++ {
		result[i].A = Point{rand.Float64() * 100., rand.Float64() * 100.}
		result[i].B = Point{rand.Float64() * 100., rand.Float64() * 100.}
		result[i].C = Point{rand.Float64() * 100., rand.Float64() * 100.}
	}
	return
}

//Perimeter using pythagoras
func (t Triangle) Perimeter() float64 {

	l1 := (math.Sqrt((math.Pow((t.C.x - t.A.x), 2)) + (math.Pow((t.C.y - t.A.y), 2))))
	l2 := (math.Sqrt((math.Pow((t.B.x - t.C.x), 2)) + (math.Pow((t.B.y - t.C.y), 2))))
	l3 := (math.Sqrt((math.Pow((t.B.x - t.A.x), 2)) + (math.Pow((t.B.y - t.A.y), 2))))
	perimeter := (l1 + l2 + l3)
	return perimeter
}

//Area using Heron's formula
func (t Triangle) Area() float64 {
	l1 := (math.Sqrt((math.Pow((t.C.x - t.A.x), 2)) + (math.Pow((t.C.y - t.A.y), 2))))
	l2 := (math.Sqrt((math.Pow((t.B.x - t.C.x), 2)) + (math.Pow((t.B.y - t.C.y), 2))))
	l3 := (math.Sqrt((math.Pow((t.B.x - t.A.x), 2)) + (math.Pow((t.B.y - t.A.y), 2))))
	perimeter := (l1 + l2 + l3)
	smePerimeter := perimeter / 2
	//AREA using heron's formula = sqrt(semiP(semiP-A)(semiP-B)(semiP-C))
	area := (math.Sqrt(smePerimeter * (smePerimeter - l1) * (smePerimeter - l2) * (smePerimeter - l3)))
	return area
}

func sort(items [1000]float64) [1000]float64 {
	var n = len(items)
	for i := 0; i < n; i++ {
		var minIdx = i
		for j := i; j < n; j++ {
			if items[j] < items[minIdx] {
				minIdx = j
			}
		}
		items[i], items[minIdx] = items[minIdx], items[i]
	}

	return items
}

func main() {
	fmt.Println("--------------------")
	//var triangleSet = []Triangle{}
	alTri := triangles10000()
	var ratio [1000]float64
	var per float64
	var are float64

	for i := 0; i < 1000; i++ {
		per = alTri[i].Perimeter()
		are = alTri[i].Area()
		ratio[i] = per / are
	}

	ratio = sort(ratio)

	var stack1 []float64
	var stack2 []float64
	for i := 0; i < 1000; i++ {
		if ratio[i] < 1.0 {
			stack1 = append(stack1, ratio[i])
		}
		if ratio[i] >= 1.0 {
			stack2 = append(stack2, ratio[i])
		}

	}
	k := len(stack1)
	l := len(stack2)

	fmt.Println("Stack  1: ", k, " Triangles")
	fmt.Println("First and last Elements in  stack1 :", stack1[0], stack1[k-1])
	fmt.Println("Stack  2: ", l, " Triangles")
	fmt.Println("First and last Elements in  stack2 :", stack2[0], stack2[l-1])

	fmt.Println("--------------------")
	/* SAMPLE TEST ZONE

	p1 := 15.0
	p2 := 20.0
	p3 := 0.0
	p4 := 10.0
	p5 := 35.0
	p6 := 5.0

	A := Point{p1, p2}
	B := Point{p3, p4}
	C := Point{p5, p6}

	tri := Triangle{A, B, C}
	peri := tri.Perimeter()
	area := tri.Area()

	println("Perimeter : ", peri)
	println("Area : ", area)


	*/

}
