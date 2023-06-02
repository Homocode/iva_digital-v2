package main

import (
	"log"

	"github.com/Homocode/liquidacion-iva-service/db"
	"github.com/Homocode/liquidacion-iva-service/pkg/initializers"
)

var config initializers.Config

func init() {
	var err error
	config, err = initializers.LoadConfig(".")
	if err != nil {
		log.Fatal("Could not load environment variables ", err)
	}

	db.ConnectDB(&config)

}

func main() {

}
