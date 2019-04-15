package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

const (
	NumRoutines = 3
	NumRequests = 1000
)

// global semaphore monitoring the number of routines
var semRout = make(chan int, NumRoutines)

// global semaphore monitoring console
var semDisp = make(chan int, 1)

// Waitgroups to ensure that main does not exit until all done
var wgRout sync.WaitGroup
var wgDisp sync.WaitGroup


type Task struct {
	a, b float32
	disp chan float32
}

func solve(t *Task) {
	// random wait between 0 and 15
	time.Sleep(time.Duration(15 * rand.Float32() * 1e9))
	// add two numbers and send to display server
	wgDisp.Add(1)
	t.disp <- t.a + t.b
	return
}

// simple request handler
func handleReq(t *Task) {
	defer wgRout.Done()
	solve(t)
	<-semRout
}

// compute server receiving requests and sending it to solvers
func ComputeServer() chan *Task {
	ch := make(chan *Task, NumRequests)
	go func() {
		for {
			wgRout.Add(1)
			semRout <- 1    // blocks until capacity is available
			// take the next task out of the request channel
			if t, ok := <-ch; ok  {
				go handleReq(t) // solve the task
			} else {
				wgRout.Done()
				break
			}    
		}
	}()
	return ch
}

// display result on the console
func DisplayServer() chan float32 {
	ch := make(chan float32, NumRequests)
	go func() {
		for res := range ch {
			semDisp <- 1
			fmt.Println("-------")
			fmt.Printf("Result: %f\n", res)
			fmt.Println("-------")
			wgDisp.Done()
			<-semDisp
		}
	}()
	return ch
}

func main() {
	dispChan := DisplayServer()
	reqChan := ComputeServer()
	for {
		var a, b float32
		semDisp <- 1
		fmt.Print("Enter two numbers: ")
		fmt.Scanf("%f %f \n", &a, &b)
		fmt.Printf("%f %f \n", a, b)
		<-semDisp
		if a == 0 && b == 0 {
			break
		}
		t := Task{a, b, dispChan}
		reqChan <- &t
		time.Sleep(1e9)
	}
	close(reqChan)
	wgRout.Wait()
	wgDisp.Wait()
	close(dispChan)
}
