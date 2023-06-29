package usecases

import (
	"github.com/Homocode/liquidacion-iva-service/internal/clientes/domain"
)

type ClientesUsecases struct {
	clientesService domain.ClientesService
}

func NewClientesUsecases(clientesService domain.ClientesService) *ClientesUsecases {
	return &ClientesUsecases{
		clientesService: clientesService,
	}
}
