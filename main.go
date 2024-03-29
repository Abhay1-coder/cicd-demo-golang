package main

import (
	"math/rand"
	"time"

	"github.com/gin-gonic/gin"
)

func main() {
	// Seed the random number generator with the current timestamp
	rand.Seed(time.Now().UnixNano())

	// Create a new Gin router
	router := gin.Default()

	// Define a route to generate and return a random number between 1 and 1000
	router.GET("/random", randomNumberHandler)

	// Run the server
	router.Run(":8085")
}

func randomNumberHandler(c *gin.Context) {
	randomNumber := rand.Intn(1000) + 1
	c.JSON(200, gin.H{"random_number": randomNumber})
}
