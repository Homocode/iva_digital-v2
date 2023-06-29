package usecases

import (
	"context"

	"github.com/Homocode/liquidacion-iva-service/internal/clientes/domain"
)

func (c *ClientesUsecases) Crear(ctx context.Context, nuevoCliente *domain.Cliente) error {
	return c.clientesService.Crear(ctx, nuevoCliente)
}
