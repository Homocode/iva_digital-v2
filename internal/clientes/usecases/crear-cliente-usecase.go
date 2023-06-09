package usecases

import (
	"context"

	contractV1 "github.com/Homocode/liquidacion-iva-service/api/http/v1/models"
)

func (c *ClientesUsecases) Create(ctx context.Context, cliente *contractV1.CreateClienteRequest) error {
	return c.clientesService.Create(ctx, cliente)
}
