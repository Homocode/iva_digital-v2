package repository

import (
	"context"

	contractV1 "github.com/Homocode/liquidacion-iva-service/api/http/v1/models"
	"github.com/Homocode/liquidacion-iva-service/db/model"
)

func (c *ClientesRepo) Create(ctx context.Context, newCliente *contractV1.CreateClienteRequest) error {
	cliente := model.Cliente{
		Cuit:        newCliente.Cuit,
		RazonSocial: newCliente.RazonSocial,
	}
	result := c.db.Create(&cliente)

	return result.Error
}
