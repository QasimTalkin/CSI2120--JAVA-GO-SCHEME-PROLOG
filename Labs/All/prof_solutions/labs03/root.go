package main

import (
	"fmt"
	"math"
)

type NegError struct {
	num float64 // negative number
}

func (e *NegError) Error() string {
	return fmt.Sprintf("Negative number %f", e.num)
}

type Div0Error struct {
}

func (e *Div0Error) Error() string {
	return fmt.Sprintf("Division by 0")
}

func rootDivN(num float64, n int) (res float64, err error) {
	if num < 0.0 {
		err = &NegError{num}
		return
	}
	if n == 0 {
		err = &Div0Error{}
		return
	}
	res = math.Sqrt(num) / float64(n)
	return
}

func main() {
	divs := []int{2, 10, 3, 0}
	nums := []float64{511.8, 0.65, -3.0, 2.123}

	for i, num := range nums {
		fmt.Printf("%d) sqrt(%f)/%d = ", i, num, divs[i])
		res, err := rootDivN(num, divs[i])
		if err == nil {
			fmt.Printf("%f\n", res)
		} else {
			switch err.(type) {
			case *NegError:
				fmt.Printf("Main NegError: %v\n", err)
				break
			case *Div0Error:
				fmt.Printf("Main Div0Error: %v\n", err)
				break
			default:
				fmt.Printf("Unknown error")

			}
		}
	}
}
