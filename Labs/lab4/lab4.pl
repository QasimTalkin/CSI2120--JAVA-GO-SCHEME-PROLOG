package main

import (
	"fmt"
	"errors"
)

//Trip type
type Trip struct {
	destination string
	weight      float32
	deadline    int
}

//Category fo embedded type
type Category struct {
	vehicle     string
	name        string
	destination string
	speed       float32
	capacity    float32
	load        float32
}

//Truck child
type Truck struct {
	Category
}

//Pickup child with bool
type Pickup struct {
	Category
	isPrivate bool
}

//TrainCar Child with string
type TrainCar struct {
	Category
	railway string
}

//NewTruck method to create a truck with new values
func (t *Truck) NewTruck() {
	t.vehicle = "Truck"
	t.name = "Truck"
	t.speed = 40
	t.capacity = 10
	t.load = 0
}

//NewPickUp method to create a truck with new values
func (p *Pickup) NewPickUp() {
	p.vehicle = "Pickup"
	p.name = "Pickup"
	p.speed = 60
	p.capacity = 2
	p.load = 0
	p.isPrivate = true
}

//NewTrainCar method to create a truck with new values
func (tc *TrainCar) NewTrainCar() {
	tc.vehicle = "TrainCar"
	tc.name = "TrainCar"
	tc.speed = 30
	tc.capacity = 30
	tc.load = 0
	tc.railway = "CNR"
}

//Transporter with addload and error
type Transporter interface {
	addload(t *Trip) (error, string)
	print()
}


func (trc *Truck) addload(t Trip) (string, error) {

	if trc.capacity > 10{
		return "oh-no", errors.New("capcaity exceeded")
	}
	
		return "added", nil
}

func (Truck) print() {

	fmt.Println("Thi sis a print for Truck method from interface")
}



//NewTorontoTrip to set trip to toronto
func (tr *Trip) NewTorontoTrip(wt float32, de int) Trip {
	tr.weight = wt
	tr.deadline = de
	tr.destination = "Toronto"
	return *tr
}

//NewMontrealTrip to set trip to montreal
func (tr *Trip) NewMontrealTrip(wt float32, de int) Trip {
	tr.weight = wt
	tr.deadline = de
	tr.destination = "Montreal"
	return *tr
}

func main() {

	//2 trucks 
	trc1 := Truck{}
	trc1.NewTruck()
	trc2 := Truck{}
	trc2.NewTruck()
	fmt.Printf("Truck = %+v\n", trc1)

	//3 pickups
	pt1 := Pickup{}
	pt1.NewPickUp()
	pt2 := Pickup{}
	pt2.NewPickUp()
	pt3 := Pickup{}
	pt3.NewPickUp()

	//1 trin car
	tc := TrainCar{}
	tc.NewTrainCar()

	dest := "Destination"
	var weight float32 = 0
	var deadline int = 1


	trips:= []Trip{}

	for {
	fmt.Println("Destination: (tor)onto, (mo)ntreal, (e)xit ?")
	fmt.Scanln(&dest)
	if dest == "e" {
		break
	} 
	if dest == "mo"{
		dest = "Montreal"
	}
	if dest == "to"{
		dest = "Toronto"
	} 

	fmt.Println("Weight:")
	fmt.Scanln(&weight)
	fmt.Println("Deadline (in hours):")
	fmt.Scanln(&deadline)
	trips = append(trips, trips.NewTorontoTrip(weight, deadline))
	}


	//assignning trips
	tr := Trip{}
	tr.NewTorontoTrip(1, 2)
	fmt.Printf("NT%v \n", tr)

	tr2 := Trip{}
	tr2.NewMontrealTrip(3, 4)
	fmt.Printf("NT%v \n", tr2)
	trc1.capacity = 25
	trc1.addload(tr)
	trc1.print()
	fmt.Printf("Truck = %+v\n", trc1)


	fmt.Println(dest)
	fmt.Println(trips)
}
