package main

import (
	"fmt"
//	"time"
)

func main() {
	src := sendInt()
	dst := filterInt(src)
	//	receiveInt(dst)
	open := true
	for open {
		i := 0
		i, open = <-dst
		if open {
			fmt.Printf("%d ", i)
		}
	}
}

func sendInt() (ch chan int) {
	defer fmt.Println("Sender ready!")
	ch = make(chan int)
	maxNum := -1
	fmt.Println("Give a number:")
	for maxNum < 0 {
		fmt.Scanf("%d", &maxNum)
	}
	go func() {
		for i := 0; i < maxNum; i++ {
			ch <- i
		}
		close(ch)
	}()
	return
}

func filterInt(src <-chan int) (dst chan int) {
	defer fmt.Println("Filter ready!")
	dst = make(chan int)
	go func() {
		defer close(dst)
		open := true
		for open {
			var i int
			i, open = <-src

			if open {
				i *= 2
				dst <- i
			}
		}
	}()
	return
}

func receiveInt(ch <-chan int) {
	defer fmt.Println("Receiver ready!")
	go func() {
		defer fmt.Println()
		open := true
		for open {
			i := 0
			i, open = <-ch
			if open {
				fmt.Printf("%d ", i)
			}
		}
	}()
	return
}
