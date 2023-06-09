package db

import (
	"fmt"

	envconfig "github.com/Homocode/liquidacion-iva-service/pkg/initializers/config"
	"github.com/Homocode/liquidacion-iva-service/pkg/initializers/logger"
	"gorm.io/driver/postgres"
	"gorm.io/gen"
	"gorm.io/gorm"
)

var DB *gorm.DB

func ConnectDB(config *envconfig.Config) {
	var err error
	dsn := fmt.Sprintf("host=%s user=%s password=%s dbname=%s port=%s sslmode=disable TimeZone=Asia/Shanghai",
		config.DBHost,
		config.DBUserName,
		config.DBUserPassword,
		config.DBName,
		config.DBPort)
	DB, err = gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		logger.Log.Fatal("Failed to connect to the Database")
	}
	logger.Log.Println("Connected Successfully to the Database")
}
func GetDBModels(gormDb *gorm.DB) {
	conf := gen.Config{
		OutPath: "../db/model",
	}
	g := gen.NewGenerator(conf)

	g.UseDB(gormDb)

	g.GenerateModel("clientes")

	g.Execute()
}
