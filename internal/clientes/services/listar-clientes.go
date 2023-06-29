package services

import (
	"context"

	"github.com/Homocode/liquidacion-iva-service/internal/clientes/domain"
)

func (c *ClientesServices) Listar(ctx context.Context) (*domain.Clientes, error) {
	return c.clientestRepo.Find(ctx)
}
