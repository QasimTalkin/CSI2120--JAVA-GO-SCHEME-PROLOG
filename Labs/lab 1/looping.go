package main

import "fmt"

func main() {
	lineWidth := 5
	symb := "x"
	lineSymb := symb
	formatStr := fmt.Sprintf("%%%ds\n", lineWidth)
	for ; len(lineSymb) < lineWidth; lineSymb += symb {
		fmt.Printf(formatStr, lineSymb)
	}
	for ; len(lineSymb) > 0; lineSymb = lineSymb[:len(lineSymb)-1] {
		fmt.Printf(formatStr, lineSymb)
	}
}
