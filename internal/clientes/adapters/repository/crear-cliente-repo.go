package repository

import (
	"context"

	"github.com/Homocode/liquidacion-iva-service/db/model"
	"github.com/Homocode/liquidacion-iva-service/internal/clientes/domain"
)

func (c *ClientesRepo) Create(ctx context.Context, nuevoCliente *domain.Cliente) error {
	cliente := model.Cliente{
		Cuit:        nuevoCliente.Cuit,
		RazonSocial: nuevoCliente.RazonSocial,
	}
	result := c.db.Create(&cliente)

	return result.Error
}
