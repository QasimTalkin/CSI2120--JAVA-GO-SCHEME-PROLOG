package main

import (
	"fmt"
	"sync"
	"time"
)

const (
	NumRoutines = 3
	NumRequests = 1000
)

// global semaphore monitoring the number of routines
var semRout = make(chan int, NumRoutines) //buffer arg = 1000

// global semaphore monitoring console
var semDisp = make(chan int, 1) //buffer arg = 1

// Waitgroups to ensure that main does not exit until all done
var wgRout sync.WaitGroup
var wgDisp sync.WaitGroup

type Task struct {
	a, b float32
	disp chan float32
}

func solve(t *Task) {
	//time.Sleep(time.Duration(rand.Intn(15000)) * time.Millisecond)
	sum := t.a + t.b
	println(sum)
	//t.disp <- sum
}

func handleReq(t *Task) {

	solve(t)

}

func ComputeServer() {

	//sendCh := make(chan Task)
	//	go handleReq(&sendCh)

}

func DisplayServer() {

}

func main() {
	fmt.Println("--------------------MAIN--------------------")
	//	dispChan := DisplayServer()
	// reqChan := ComputeServer()
	for {
		var a, b float32

		// make sure to use semDisp
		// …
		fmt.Print("Enter two numbers: ")
		fmt.Scanf("%f %f \n", &a, &b)
		fmt.Printf("%f %f \n", a, b)
		fmt.Println("----------- ")
		fmt.Println("Result: ", a+b)
		fmt.Println("----------- ")
		if a == 0 && b == 0 {
			break
		}

		// Create task and send to ComputeServer
		//sendCh := make(chan Task)
		//go handleReq(sendCh)
		//proc := process{dur: dur, ch: make(chan time.Duration)}

		myTask := &Task{a: a, b: b, disp: make(chan float32)}

		handleReq(myTask)

		time.Sleep(1e9)

	}
	// Don’t exit until all is done
}
