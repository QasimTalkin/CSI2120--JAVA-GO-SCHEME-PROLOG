package main

import (
	"fmt"
	"time"
	"strconv"
)

var i int

func prepare(cs chan string) {
	i = i + 1
	cakeName := "Cake " + strconv.Itoa(i)
	fmt.Println("Preparing ...", cakeName)
	cs <- cakeName // send
}

func receive(cs chan string) {
	s := <-cs 
	fmt.Println("Received: ", s)
}

func main() {
	cs := make(chan string)
	for i := 0; i<3; i++ {
		go prepare(cs)
		go receive(cs)
		
		time.Sleep(1 * 1e9)
	}
}
