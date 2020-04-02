package main

import "fmt"

func Add(xs ...int) int {
	var x int
	for _, x = range xs {
		x += x
	}

	return x
}

func main() {
	nums := []int{1, 2, 3}
	fmt.Println(Add(nums...))
}
