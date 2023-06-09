package contractV1

type CreateClienteRequest struct {
	Cuit        string `json:"cuit" validate:"valCuitFormat"`
	RazonSocial string `json:"razon_social" validate:"required"`
}
type CreateClienteResponse struct {
	Cuit        string `json:"cuit"`
	RazonSocial string `json:"razon_social"`
}
