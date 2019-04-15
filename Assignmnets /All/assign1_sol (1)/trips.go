package main

import (
	"errors"
	"fmt"
	"strings"
)

type Trip struct {
	destination string
	weight      float32
	deadline    int
}

type Truck struct {
	vehicle     string
	name        string
	destination string
	speed       float32
	capacity    float32
	load        float32
}

type Pickup struct {
	Truck
	isPrivate bool
}

type TrainCar struct {
	Truck
	railway string
}

func NewTruck(n string) (t *Truck) {
	t = new(Truck)
	t.vehicle = "Truck"
	t.name = n
	t.speed = 40
	t.capacity = 10
	return
}

func NewPickup(n string) (p *Pickup) {
	p = new(Pickup)
	p.vehicle = "Pickup"
	p.name = n
	p.speed = 60
	p.capacity = 2
	p.isPrivate = true
	return
}

func NewTrainCar(n string) (t *TrainCar) {
	t = new(TrainCar)
	t.vehicle = "TrainCar"
	t.name = n
	t.speed = 30
	t.capacity = 30
	t.railway = "CNR"
	return
}

type Transporter interface {
	addLoad(*Trip) error
	print()
}

func (v *Truck) addLoad(t *Trip) (err error) {
	if strings.Compare(v.destination, "") != 0 &&
		strings.Compare(v.destination, t.destination) != 0 {
		err = errors.New("Other destination")
		return
	}
	if v.capacity < t.weight+v.load {
		err = errors.New("Out of capacity")
		return
	}
	var travel float32
	switch t.destination {
	case "Toronto":
		travel = 400.0 / v.speed
		break
	case "Montreal":
		travel = 200.0 / v.speed
		break
	default:
		err = errors.New("Unknown destination")
		return
	}
	if float32(t.deadline) < travel {
		err = errors.New("Not enough time")
		return
	}
	v.destination = t.destination
	v.load += t.weight
	return
}

func (t *Truck) print() {
	fmt.Printf("%s %s to %s with %f tons",
		t.vehicle, t.name, t.destination, t.load)
	return
}

/*
func (v *Pickup) addLoad(t *Trip) (err error) {
	err = v.Truck.addLoad(t)
	return
}
*/
func (v *Pickup) print() {
	(&v.Truck).print()
	fmt.Printf(" (Private: %v)", v.isPrivate)
	return
}

/*
func (v *TrainCar) addLoad(t *Trip) (err error) {
	err = v.Truck.addLoad(t)
	return
}
*/
func (v *TrainCar) print() {
	(&v.Truck).print()
	fmt.Printf(" (%s)", v.railway)
	return
}

func NewTorontoTrip(w float32, d int) (t *Trip) {
	t = new(Trip)
	t.destination = "Toronto"
	t.weight = w
	t.deadline = d
	return
}

func NewMontrealTrip(w float32, d int) (t *Trip) {
	t = new(Trip)
	t.destination = "Montreal"
	t.weight = w
	t.deadline = d
	return
}

func main() {
	vehicles := []Transporter{NewTruck("A"), NewTruck("B"), NewPickup("A"), NewPickup("B"), NewPickup("C"), NewTrainCar("A")}
	var trips []Trip
	for {
		var destination string
		var weight float32
		var deadline int
		fmt.Print("Destination: (t)oronto, (m)ontreal, else exit? ")
		fmt.Scanf("%s \n", &destination)
		destination = strings.ToLower(destination)
		if !(strings.HasPrefix(destination, "t") ||
			strings.HasPrefix(destination, "m")) {
			fmt.Println("Not going to TO or Montreal, bye!")
			break
		}
		fmt.Print("Weight: ")
		fmt.Scanf("%f \n", &weight)
		fmt.Print("Deadline (in hours): ")
		fmt.Scanf("%d \n", &deadline)
		destination = strings.ToLower(destination)
		if strings.HasPrefix(destination, "t") {
			trips = append(trips, *NewTorontoTrip(weight, deadline))
		} else {
			trips = append(trips, *NewMontrealTrip(weight, deadline))
		}
		loaded := false
		for _, veh := range vehicles {
			if err := veh.addLoad(&trips[len(trips)-1]); err == nil {
				loaded = true
				break
			} else {
				fmt.Printf("Error: %s \n", err)
			}
		}
		if !loaded {
			trips = trips[:len(trips)-1]
			fmt.Println("Can not accept trip!")
		}
	}
	fmt.Println("Trips:")
	fmt.Printf("%v \n", trips)
	fmt.Println("Vehicles:")
	for _, v := range vehicles {
		v.print()
		fmt.Println()
	}
	return
}
