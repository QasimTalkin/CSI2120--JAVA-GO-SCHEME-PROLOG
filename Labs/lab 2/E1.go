

package main


import ("fmt")



type dog struct {
	name string
	race string
	female bool
  }

  func (x *dog) rename(y string) string {
	
	x.name = y
    return "1"
}
  
  func main() {
	  fido := dog {"Fido", "Poodle", false }
	  fmt.Println(fido.name)
	  var g =fido.rename("Coyote")
	  fmt.Println(g)
	 
  }