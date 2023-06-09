package services

import (
	"context"

	contractV1 "github.com/Homocode/liquidacion-iva-service/api/http/v1/models"
)

func (c *ClientesServices) Create(ctx context.Context, cliente *contractV1.CreateClienteRequest) error {
	return c.clientestRepo.Create(ctx, cliente)
}
