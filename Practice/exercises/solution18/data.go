package main

import "fmt"

import "math"
import "math/rand"

type Series struct {
	a, b float64
}

func fourier(c [32]Series, t, TP int, out chan float64) {
	res := c[0].a
	for n := 1; n < 32; n++ {
		res += c[n].a*math.Sin(2.0*math.Pi*float64(t)/float64(TP)) + c[n].b*math.Cos(2.0*math.Pi*float64(t)/float64(TP))
	}
	out <- res
	return
}

func fourierSlice(c []Series, t, TP int, out chan float64) {
	res := c[0].a
	for n := 1; n < len(c); n++ {
		res += c[n].a*math.Sin(2.0*math.Pi*float64(t)/float64(TP)) + c[n].b*math.Cos(2.0*math.Pi*float64(t)/float64(TP))
	}
	out <- res
	return
}

func receive(data chan float64, TP int) (endOfCalc chan bool) {
	endOfCalc = make(chan bool)
	//	go func() {
	for t := 0; t < TP; t++ {
		f := <-data
		fmt.Printf("%f received \n ", f)
	}
	fmt.Println()
	endOfCalc <- true
	//	}()
	return
}

func main() {

	data := make(chan float64)
	defer close(data)
	var c []Series
	TP := 4

	for t := 0; t < TP; t++ {
		for k := 0; k < len(c); k++ {
			c[k].a = rand.Float64()
			c[k].b = rand.Float64()
		}
		go fourierSlice(c, t, TP, data)
	}

	endOfCalc := receive(data, TP)
	//defer close(endOfCalc)
	eoc := <-endOfCalc
	if eoc {
		fmt.Println("All done")
	}
}
