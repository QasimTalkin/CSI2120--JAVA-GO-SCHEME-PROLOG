package main

import "fmt"

func limits(x float64) (l, u int) {
	l = int(x)
	if x > 0 {
		u = l + 1
	} else {
		u = l
		l = u - 1
	}
	return
}

func main() {
	x := 32.6
	l,u := limits(x)
	fmt.Printf("%f Limits %d %d\n", x, l, u )
	x = -3.2
	l,u = limits(x)
	fmt.Printf("%f Limits %d %d\n", x, l, u )
}
