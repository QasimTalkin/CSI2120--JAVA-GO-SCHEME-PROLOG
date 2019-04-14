package main

import "fmt"

type Flower struct {
	name  string
	color string
	price float64
}

type Tree struct {
	name          string
	height        float64
	pricePerMeter float64
}

type Item interface {
	getPrice() float64
}

func main() {
	gardenStore := [2]Item{Tree{"maple", 1.5, 20.0},
		Flower{"tulip", "red", 2.0}}
	price := 0.0
	for _, p := range gardenStore {
		price += p.getPrice()
	}
	fmt.Printf("Price: $%6.2f", price)
}

func (t Tree) getPrice() float64 {
	return t.pricePerMeter * t.height
}

func (f Flower) getPrice() (float64) {
	return f.price
}

