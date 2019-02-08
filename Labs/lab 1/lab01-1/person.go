package main

import "fmt"

type Person struct {
	lastName  string
	firstName string
	iD        int
}

func inPerson(p *Person, lastId int) (nextId int, err error) {
	nextId = lastId
	// Enter last name
	fmt.Print("Last Name: ")
	_, err = fmt.Scanf("%s", &p.lastName)
	if err != nil {
		return
	}
	// Enter first name
	fmt.Print("First Name: ")
	_, err = fmt.Scanf("%s", &p.firstName)
	if err != nil {
		return
	}
	// generate ID
	nextId += 1
	p.iD = nextId
	return
}

func printPerson(p Person) {
	//
	fmt.Printf("%10.d\t%s\t%s\n", p.iD, p.firstName, p.lastName)

}

func main() {
	nextId := 101
	for {
		var (
			p   Person
			err error
		)
		nextId, err = inPerson(&p, nextId)
		if err != nil {
			fmt.Println("Invalid entry ... exiting")
			break
		}
		printPerson(p)
	}
}
