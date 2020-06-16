package main

import (
	"net/http"

	"github.com/labstack/echo"
)

type handler struct{}

func (h *handler) health(c echo.Context) error {
	return c.JSON(http.StatusOK, "OK")
}
