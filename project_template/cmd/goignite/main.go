package main

import "github.com/labstack/echo"

func main() {

	e := echo.New()

	var h handler
	e.GET("/health", h.health)
}
