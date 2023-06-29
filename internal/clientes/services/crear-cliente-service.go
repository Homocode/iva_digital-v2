package services

import (
	"context"

	"github.com/Homocode/liquidacion-iva-service/internal/clientes/domain"
)

func (c *ClientesServices) Crear(ctx context.Context, nuevoCliente *domain.Cliente) error {
	return c.clientestRepo.Create(ctx, nuevoCliente)
}
