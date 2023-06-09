package usecases

import (
	"context"

	contractV1 "github.com/Homocode/liquidacion-iva-service/api/http/v1/models"
)

type ClientesUsecases struct {
	clientesService ClientesService
}

type ClientesService interface {
	Create(ctx context.Context, cliente *contractV1.CreateClienteRequest) error
}

func NewClientesUsecases(clientesService ClientesService) *ClientesUsecases {
	return &ClientesUsecases{
		clientesService: clientesService,
	}
}
