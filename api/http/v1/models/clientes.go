package contractV1

import "context"

// Definicion del esquema (estrutura y comportamiento) de la entidad Cliente del punto de vista
// de la request y el response (como es implementado para la request y el response)

// Estructura
type Cliente struct {
	Cuit        string `json:"cuit" validate:"valCuitFormat"`
	RazonSocial string `json:"razon_social" validate:"required"`
}

type Clientes []Cliente

// Comportamiento
type ClienteUsecases interface {
	Crear(ctx context.Context, nuevoCliente *Cliente) error
	Listar(ctx context.Context) (*Clientes, error)
	//Borrar(ctx context.Context, cuit string) error
}
