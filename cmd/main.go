package main

import (
	"fmt"

	"github.com/Homocode/liquidacion-iva-service/infrastructure/adapters/db"
	server "github.com/Homocode/liquidacion-iva-service/infrastructure/adapters/http-server"
	envconfig "github.com/Homocode/liquidacion-iva-service/internal/app/config"
	"github.com/Homocode/liquidacion-iva-service/internal/app/logger"
	"github.com/Homocode/liquidacion-iva-service/internal/app/validation"
	controller "github.com/Homocode/liquidacion-iva-service/internal/clientes/adapters/controllers"
	"github.com/Homocode/liquidacion-iva-service/internal/clientes/adapters/repository"
	"github.com/Homocode/liquidacion-iva-service/internal/clientes/services"
	usecases "github.com/Homocode/liquidacion-iva-service/internal/clientes/usecases"
)

var config *envconfig.Config

func init() {
	logger.SetLogger()

	var err error
	config, err = envconfig.LoadConfig(".")
	if err != nil {
		logger.Log.Fatal("Could not load environment variables ", err)
	}
	db.ConnectDB(config)

	db.GetDBModels(db.DB)

	validation.SetValidator()

}

func main() {

	clientesRepo := repository.NewAccountRepo(db.DB)
	clientesService := services.NewClientesService(clientesRepo)
	clientesUsecases := usecases.NewClientesUsecases(clientesService)
	clientesHandler := controller.NewClienteHandler(clientesUsecases)

	router := server.NewRouter(clientesHandler)

	s := server.NewServer(fmt.Sprintf(":%s", config.ServerPort), router)

	err := s.ListenAndServe()
	if err != nil {
		logger.Log.Fatalln(err)
	}
}
