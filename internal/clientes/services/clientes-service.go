package services

import (
	"context"

	contractV1 "github.com/Homocode/liquidacion-iva-service/api/http/v1/models"
)

type ClientesServices struct {
	clientestRepo ClientesRepo
}

type ClientesRepo interface {
	Create(ctx context.Context, cliente *contractV1.CreateClienteRequest) error
}

func NewClientesService(clientesRepo ClientesRepo) *ClientesServices {
	return &ClientesServices{
		clientestRepo: clientesRepo,
	}
}
