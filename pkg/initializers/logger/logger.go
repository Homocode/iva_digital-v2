package logger

import (
	"log"
	"os"
)

var Log *log.Logger

func SetLogger() {
	Log = log.New(os.Stdout, "liquidacion-iva-api ", log.LstdFlags|log.Lshortfile)
}
