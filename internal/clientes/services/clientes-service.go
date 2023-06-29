package services

import (
	"github.com/Homocode/liquidacion-iva-service/internal/clientes/domain"
)

type ClientesServices struct {
	clientestRepo domain.ClientesRepo
}

func NewClientesService(clientesRepo domain.ClientesRepo) *ClientesServices {
	return &ClientesServices{
		clientestRepo: clientesRepo,
	}
}
