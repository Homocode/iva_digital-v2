package domain

import (
	"context"
)

// Definicion del esquema (estrutura y comportamiento) de la entidad Cliente del punto de vista
// de la aplicacion

type Cliente struct {
	Cuit        string
	RazonSocial string
}

type Clientes []Cliente

// Contrato de uso para el servicio de Cliente
type ClientesUsecases interface {
	Crear(ctx context.Context, nuevoCliente *Cliente) error
	Listar(ctx context.Context) (*Clientes, error)
}

// Contrato de uso para el servicio de Cliente
type ClientesService interface {
	Crear(ctx context.Context, nuevoCliente *Cliente) error
	Listar(ctx context.Context) (*Clientes, error)
}

// Contrato de uso para el repositorio de Cliente
type ClientesRepo interface {
	clientesReader
	clientesWriter
}

type clientesReader interface {
	Find(ctx context.Context) (*Clientes, error)
}

type clientesWriter interface {
	Create(ctx context.Context, nuevoCliente *Cliente) error
	//BorrarCliente(ctx context.Context, cuit string) error
}
