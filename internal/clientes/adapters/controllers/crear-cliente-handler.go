package controllers

import (
	"fmt"
	"net/http"

	contractV1 "github.com/Homocode/liquidacion-iva-service/api/http/v1/models"
	"github.com/Homocode/liquidacion-iva-service/internal/app/logger"
	"github.com/Homocode/liquidacion-iva-service/internal/clientes/domain"
)

var (
	errDuplicateKeyCuit = "ERROR: duplicate key value violates unique constraint \"clientes_cuit_key\" (SQLSTATE 23505)"
)

func (c *ClienteHandler) Crear(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()
	datosRequest, ok := ctx.Value(keyCliente{}).(*contractV1.CreateClienteRequest)
	if !ok {
		w.WriteHeader(http.StatusInternalServerError)
		logger.Log.Println("[ERROR] Unexpected: Can`t get value from context in package controller, ClienteHandler.Create")
	}

	newCliente := &domain.Cliente{
		Cuit:        datosRequest.Cuit,
		RazonSocial: datosRequest.RazonSocial,
	}

	err := c.clientesUseCases.Crear(ctx, newCliente)
	if err != nil {
		switch err.Error() {
		case errDuplicateKeyCuit:
			http.Error(w, fmt.Sprintf("[ERROR] DB: A client record already exist with that cuit \n %s", err.Error()), http.StatusConflict)
		default:
			logger.Log.Println(err.Error())
			http.Error(w, fmt.Sprintf("[ERROR] DB: %s", err.Error()), http.StatusInternalServerError)
		}
	}
	w.WriteHeader(http.StatusCreated)
}
