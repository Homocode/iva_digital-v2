package usecases

import (
	"context"

	"github.com/Homocode/liquidacion-iva-service/internal/clientes/domain"
)

func (c *ClientesUsecases) Listar(ctx context.Context) (*domain.Clientes, error) {
	return c.clientesService.Listar(ctx)
}
