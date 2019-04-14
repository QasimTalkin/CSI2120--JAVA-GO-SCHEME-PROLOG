// question 9 complete the function send string for the main program to receiveand print the 4 animal strings and than exit
package main

import "fmt"

func main() {
	animals := []string{"coyote", "fox", "hare", "deer"}
	ch := sendString(animals)
	for {
		str, ok := <-ch
		if !ok {
			break
		}
		fmt.Printf("%s \n", str)
	}
}

func sendString(strArr []string) chan string {
	ch := make(chan string)
	go func() { // start a lambda in a go routine
		for i := range strArr {
			ch <- strArr[i]
			// for _,s := range strArr { //
			// 	ch <- s //
		} //
		close(ch) //
	}()
	return ch
}
