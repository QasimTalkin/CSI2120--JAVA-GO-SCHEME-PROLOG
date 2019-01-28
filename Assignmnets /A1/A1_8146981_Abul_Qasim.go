package main

import (
	"fmt"
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
	addload(t *Trip) (err error)
	print()
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
	println("testgot")
	t := Truck{}
	t.NewTruck()
	fmt.Printf("Truck = %+v\n", t)

	pt := Pickup{}
	pt.NewPickUp()
	fmt.Printf("Truck = %+v\n", pt)

	tc := TrainCar{}
	tc.NewTrainCar()
	fmt.Printf("Truck = %+v\n", tc)

	tr := Trip{}
	tr.NewTorontoTrip(1, 2)
	fmt.Printf("NT%v \n", tr)

	tr2 := Trip{}
	tr2.NewMontrealTrip(3, 4)
	fmt.Printf("NT%v \n", tr2)
}
