package main

import (
	"fmt"
	"errors"
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
	t:= Truck{}
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
func  NewTorontoTrip(wt float32, de int) Trip {
	tr := Trip{}
	tr.weight = wt
	tr.deadline = de
	tr.destination = "Toronto"
	return tr
}
//NewMontrealTrip to set trip to montreal
func NewMontrealTrip(wt float32, de int) Trip {
	tr:= Trip{}
	tr.weight = wt
	tr.deadline = de
	tr.destination = "Montreal"
	return tr
}
//Truck pointer to addload-transporter interface
func (tr *Truck) addload(t Trip) error {
	if t.weight > tr.capacity {
		return errors.New("Error:  Out of Capacity")
	}
	if tr.destination == "" {
		tr.destination = t.destination
	}
	if tr.destination != t.destination {
		return errors.New("Error: Wrong Destination")
	}
	tr.load = t.weight
	fmt.Println("Destination updated")
	return nil
}
//Truck pointer to print-transporter interface
func (tr *Truck) print() {
	fmt.Printf("%s %s to %s with %f tons", tr.vehicle, tr.name, tr.destination, tr.load)
}


/*
//Pickup pointer to addload-transporterinterface
func (pu *Pickup) addload(t Trip) error {
	if t.weight > pu.capacity {
		return errors.New("Error:  Out of Capacity")
	}
	if pu.destination == "" {
		pu.destination = t.destination
	}
	if pu.destination != t.destination {
		return errors.New("Error: Wrong Destination")
	}
	pu.load = t.weight
	return nil
}
//Pickup pointer to print-transporter interface
func (pu *Pickup) print() {
	fmt.Printf("%s %s to %s with %f tons", pu.vehicle, pu.name, pu.destination, pu.load)
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
	fmt.Printf("%s %s to %s with %f tons", tc.vehicle, tc.name, tc.destination, tc.load)
}

*/
//main 
func main() {
/*
	//Time required for each vehicle type to reach destination
	var truck_time_toronot = 10
	var truck_time_montreal = 5
	var pickup_time_toronot = 400/60
	var pickup_time_montreal = 200/60
	var tc_time_toronot = 20
	var tc_time_montreal = 10
*/
//decling new vehicle 
	t1 := NewTruck()
	t1.name ="A"
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

//adding them to interface array
	var My_Transpot_Vehicle []interface{}
	My_Transpot_Vehicle = append(My_Transpot_Vehicle, t1)
	My_Transpot_Vehicle = append(My_Transpot_Vehicle, t2)
	My_Transpot_Vehicle = append(My_Transpot_Vehicle, p1)
	My_Transpot_Vehicle = append(My_Transpot_Vehicle, p2)
	My_Transpot_Vehicle = append(My_Transpot_Vehicle, p3)
	My_Transpot_Vehicle = append(My_Transpot_Vehicle, tc1)

	fmt.Println("-----------------------------------------------------")


//Looping through for user input


	for {
		dest := "D"
		var wt float32 = 0
		var deadline int = 0
		fmt.Println("Destination: (tor)onto, (mo)ntreal, (e)xit ?")
		fmt.Scanln(&dest)
		fmt.Println("Weight: ")
		fmt.Scanln(&wt)
		fmt.Println("Deadline (in hours) : ")
		fmt.Scanln(&deadline)

		if wt>30 || deadline >20 {
			fmt.Println("Invalid Wt/dealine")
			break
		} continue

		if strings.HasPrefix(dest, "t") || strings.HasPrefix(dest, "T") {

		fmt.Println("YES")
		for i := range My_Transpot_Vehicle {
			fmt.Print(i)
			
		}

		}

	}
	/*
	name := make([]interface{}, len(l1))
	for i, s := range l1 {
		name[i] = s
	}

	fmt.Println("hhheyyyy", name)

 
	trip1 := NewMontrealTrip(2.0,3)
	t1.addload(trip1)
	t1.print()
	trip2 := NewTorontoTrip(2.0,3)
	err := t2.addload(trip2)
	fmt.Println(err)
	fmt.Println(trip2.destination)


	//var anything []interface{}


	




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
		
		}
	






	
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

	*/
}
