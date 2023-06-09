package controller

import (
	"context"

	contractV1 "github.com/Homocode/liquidacion-iva-service/api/http/v1/models"
)

type ClienteHandler struct {
	clientesUseCases ClientesUsecases
}

type ClientesUsecases interface {
	Create(ctx context.Context, cliente *contractV1.CreateClienteRequest) error
}

type keyCliente struct{}

func NewClienteHandler(clientesUsecases ClientesUsecases) *ClienteHandler {
	return &ClienteHandler{
		clientesUseCases: clientesUsecases,
	}
}
