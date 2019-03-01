package main

import (
	"errors"
	"fmt"
	"strings"
)

//Trip type
type Trip struct {
	destination string
	weight      float32
	deadline    int
}

//My_Vehicle fo embedded type
type My_Vehicle struct {
	vehicle     string
	name        string
	destination string
	speed       float32
	capacity    float32
	load        float32
}

//Truck child
type Truck struct {
	My_Vehicle
}

//Pickup child with bool
type Pickup struct {
	My_Vehicle
	isPrivate bool
}

//TrainCar Child with string
type TrainCar struct {
	My_Vehicle
	railway string
}

//NewTruck method to create a truck with new values
func NewTruck() Truck {
	t := Truck{}
	t.vehicle = "Truck"
	t.destination = ""
	t.name = "Truck"
	t.speed = 40
	t.capacity = 10
	t.load = 0
	return t
}

//NewPickUp method to create a truck with new values
func NewPickUp() Pickup {
	p := Pickup{}
	p.vehicle = "Pickup"
	p.destination = ""
	p.name = "Pickup"
	p.speed = 60
	p.capacity = 2
	p.load = 0
	p.isPrivate = true
	return p
}

//NewTrainCar method to create a truck with new values
func NewTrainCar() TrainCar {
	tc := TrainCar{}
	tc.vehicle = "TrainCar"
	tc.name = "TrainCar"
	tc.destination = ""
	tc.speed = 30
	tc.capacity = 30
	tc.load = 0
	tc.railway = "CNR"
	return tc
}

//Transporter with addload and error
type Transporter interface {
	addload(Trip) error
	print()
}

//NewTorontoTrip to set trip to toronto
func NewTorontoTrip(wt float32, de int) Trip {
	tr := Trip{}
	tr.weight = wt
	tr.deadline = de
	tr.destination = "Toronto"
	return tr
}

//NewMontrealTrip to set trip to montreal
func NewMontrealTrip(wt float32, de int) Trip {
	tr := Trip{}
	tr.weight = wt
	tr.deadline = de
	tr.destination = "Montreal"
	return tr
}

//Truck pointer to addload-transporter interface
func (tr *Truck) addload(t Trip) error {
	if tr.destination == "" {
		tr.destination = t.destination
	}
	if tr.destination != t.destination {
		return errors.New("Error: Wrong Destination")
	}
	if t.weight > tr.capacity || (10-tr.load) <= 0 || (tr.load+t.weight) > 10 {
		return errors.New("Error:  Out of Capacity")
	}
	if strings.Compare(tr.destination, "Montreal") == 1 && t.deadline < int(200/tr.speed) {
		return errors.New("Deadline too short")
	}
	if strings.Compare(tr.destination, "Toronto") == 1 && t.deadline < int(400/tr.speed) {
		return errors.New("Deadline too short")
	}
	tr.load = tr.load + t.weight
	fmt.Printf("Destination updated to %s \n", t.destination)
	return nil
}

//Truck pointer to print-transporter interface
func (tr *Truck) print() {
	fmt.Printf("%s %s to %s with %f tons \n", tr.vehicle, tr.name, tr.destination, tr.load)
}

//Pickup pointer to addload-transporterinterface
func (pu *Pickup) addload(t Trip) error {
	if pu.destination == "" {
		pu.destination = t.destination
	}
	if pu.destination != t.destination {
		return errors.New("Error: Wrong Destination")
	}
	if t.weight > pu.capacity || (10-pu.load) <= 0 || (pu.load+t.weight) > 10 {
		return errors.New("Error:  Out of Capacity")
	}
	if strings.Compare(pu.destination, "Montreal") == 1 && t.deadline < int(200/pu.speed) {
		return errors.New("Deadline too short")
	}
	if strings.Compare(pu.destination, "Toronto") == 1 && t.deadline < int(400/pu.speed) {
		return errors.New("Deadline too short")
	}
	pu.load = pu.load + t.weight
	fmt.Printf("Destination updated to %s \n", t.destination)
	return nil
}

//Pickup pointer to print-transporter interface
func (pu *Pickup) print() {
	fmt.Printf("%s %s to %s with %f tons (Private: %t) \n", pu.vehicle, pu.name, pu.destination, pu.load, pu.isPrivate)
}

//TrainCar pointer to addload-transporter interface
func (tc *TrainCar) addload(t Trip) error {
	if t.weight > tc.capacity {
		return errors.New("Error:  Out of Capacity")
	}
	if tc.destination == "" {
		tc.destination = t.destination
	}
	if tc.destination != t.destination {
		return errors.New("Error: Wrong Destination")
	}
	tc.load = t.weight
	return nil
}

//TrainCar pointer to print-transporter interface
func (tc *TrainCar) print() {
	fmt.Printf("%s %s to %s with %f tons ( %s ) \n", tc.vehicle, tc.name, tc.destination, tc.load, tc.railway)
}

//main
func main() {
	/*	//Time required for each vehicle type to reach destination
		var truck_time_toronot = 10
		var truck_time_montreal = 5
		var pickup_time_toronot = 400/60
		var pickup_time_montreal = 200/60
		var tc_time_toronot = 20
		var tc_time_montreal = 10
	*/
	//decling new vehicle
	t1 := NewTruck()
	t1.name = "A"
	t2 := NewTruck()
	t2.name = "B"
	p1 := NewPickUp()
	p1.name = "A"
	p2 := NewPickUp()
	p2.name = "B"
	p3 := NewPickUp()
	p3.name = "C"
	tc1 := NewTrainCar()
	tc1.name = "A"
	my_trans := [...]Transporter{&t1, &t2, &p1, &p2, &p3, &tc1}
	my_trip_slice := []Trip{}
	fmt.Println("-----------------------------------------------------")
	/*
		trp1 := NewTorontoTrip(5,7)
		my_trip_slice := []Trip{}
		my_trip_slice = append (my_trip_slice, trp1)
		fmt.Println("Trips: ", my_trip_slice)
	*/
	//looping thru console
	for {
		dest := "D"
		var wt float32 = 0
		var deadline int = 0
		the_trip := Trip{}
		p_the_trip := &the_trip
		fmt.Print("Destination: (T)oronto, (M)ontreal, (e)xit ? ")
		fmt.Scanln(&dest)
		if strings.HasPrefix(dest, "e") || strings.HasPrefix(dest, "E") || strings.HasPrefix(dest, "q") || strings.HasPrefix(dest, "Q") {
			fmt.Println("-----------------------------------------------------")
			fmt.Println("Not going to Toronto or Montreal, bye!!!")
			break
		}
		fmt.Print("Weight: ")
		fmt.Scanln(&wt)
		fmt.Print("Deadline (in hours) : ")
		fmt.Scanln(&deadline)
		if strings.HasPrefix(dest, "t") || strings.HasPrefix(dest, "T") {
			*p_the_trip = NewTorontoTrip(wt, deadline)
		}
		if strings.HasPrefix(dest, "m") || strings.HasPrefix(dest, "M") {
			*p_the_trip = NewMontrealTrip(wt, deadline)
		}
		for _, element := range my_trans {
			err := element.addload(*p_the_trip)
			if err != nil {
				fmt.Print(err, "\n")
			}
			if err == nil {
				element.print()
				fmt.Println("-----------------------------------------------------")
				my_trip_slice = append(my_trip_slice, *p_the_trip)
				break
			}

		} //for end

	} //for end
	//final print after loop
	fmt.Println("Trips: ", my_trip_slice)
	for _, element := range my_trans {
		element.print()
	}
	fmt.Println("-----------------------------------------------------")

}
