package controllers

import "github.com/Homocode/liquidacion-iva-service/internal/clientes/domain"

type ClienteHandler struct {
	clientesUseCases domain.ClientesUsecases
}

type keyCliente struct{}

func NewClienteHandler(clientesUsecases domain.ClientesUsecases) *ClienteHandler {
	return &ClienteHandler{
		clientesUseCases: clientesUsecases,
	}
}
