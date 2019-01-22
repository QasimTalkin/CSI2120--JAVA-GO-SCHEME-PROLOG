//Abul Qasim Lab 01 - 8146981
/*  NOTES
~ For type use /t abd for value use /v

/*Write a function in Go that takes as input a float variable and returns two integer values. 
One integer value which is the floor of the float value and the second integer value which is the ceiling of the float value. Print the result to console.*/


// Q1

/*
package main

import (
	"fmt"
	"math"
)

//E1
func float2int(x float64) ( a float64, b float64) {
	a = math.Floor(x)
	b = math.Ceil(x)
	return
}

//E2 
func designString (x string) {
	
	for i:=1; i<=5 ; i++ {
		for j:=1; j<=i; j++{
		print(x)
		}
		print("\n")	
	}
	for i:=1; i<=4 ; i++ {
		for j:=4; j>=i; j--{
		print(x)
		}
		print("\n")	
	}
}
//E3
type Person struct {
	ln string
	fn string
	id int
}



func main(){

	//E1
	fmt.Print("E1 Enter a float number : ")
	var input float64
	fmt.Scanln(&input)
	x, y := float2int(input)
	fmt.Print("The floor of you input is ", x, " and the celling is ", y, "\n")
	//E2
	fmt.Print("E1 design you want to disply: ")
	var input2 string 
	fmt.Scanln(&input2)
	designString(input2)

	//E3
	type Person struct {
		ln string
		fn string
		id int
	}


	var per [10]Person
	p01 := Person{"Qasim", "Abul", 1}
	p1 := &p01
	p02 := Person{"Sadaf", "Zehera", 2}
	p2 := &p02
	p2.id = 5
	p1.ln = "qas"
	per[1] = p01
	per[2] =  p02
	fmt.Print(p1.ln, " ", per[2].id, "\n")



}

*/

package main

import "fmt"
import "math"
import "math/rand"

type Series struct {
	a, b float64
}

func (s Series) add(t, TP int) float64 {
	return s.a*math.Sin(2.0*math.Pi*float64(t)/float64(TP)) + s.b*math.Cos(2.0*math.Pi*float64(t)/float64(TP))
}

func fourier(c []Series, t, TP int) (res float64) {
	res = c[0].a
	for n := 1; n < len(c); n++ {
		res += c[n].add(t, TP)
	}
	return
}

func main() {
	TP := 4
	sz := 1
	var res float64

	// Enter size of fourier series
	fmt.Print("Size of series (positive integer) :")
	// Depending on your environment you may have to remove \n in the scanf
	_, err := fmt.Scanf("%d \n", &sz)
	for err != nil || sz < 1  {
		fmt.Println("Must be positive integer.")
		_, err = fmt.Scanf("%d \n", &sz)
	}
	fmt.Printf("Size: %d\n", sz)

	
	var c = make([]Series, sz)

	for t := 0; t < TP; t++ {
		for k := 0; k < len(c); k++ {
			c[k].a = rand.Float64()
			c[k].b = rand.Float64()
		}
		res += fourier(c, t, TP)
		fmt.Printf("%f ", res)
		fmt.Println()
	}
}