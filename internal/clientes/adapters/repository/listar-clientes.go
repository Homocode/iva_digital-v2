package repository

import (
	"context"

	"github.com/Homocode/liquidacion-iva-service/internal/clientes/domain"
)

func (c *ClientesRepo) Find(ctx context.Context) (*domain.Clientes, error) {
	var clientes *domain.Clientes

	result := c.db.Table("clientes").Find(&clientes)

	return clientes, result.Error
}
