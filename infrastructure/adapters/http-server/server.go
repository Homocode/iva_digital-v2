package server

import (
	"net/http"

	controller "github.com/Homocode/liquidacion-iva-service/internal/clientes/adapters/controllers"
	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
)

type Server struct {
	*http.Server
}

func NewServer(addr string, router http.Handler) *Server {
	corsHandler := handlers.CORS(
		handlers.AllowedOrigins([]string{"*"}),
		handlers.AllowedMethods([]string{"GET", "POST", "PATCH", "DELETE"}),
		handlers.AllowedHeaders([]string{"X-Requested-With", "Content-Type", "Authorization"}),
	)
	s := &Server{
		&http.Server{
			Addr:    addr,
			Handler: corsHandler(router),
		},
	}

	return s
}

// Adapter is an alias to don´t type so much.
type Adapter func(http.Handler) http.Handler

// Adapt takes Handler funcs and chains them to the main handler.
func Adapt(handler http.Handler, adapters ...Adapter) http.Handler {
	// The loop is reversed so the adapters/middleware gets executed in the same
	// order as provided in the array.
	for i := len(adapters); i > 0; i-- {
		handler = adapters[i-1](handler)
	}
	return handler
}

func NewRouter(clientesHandler *controller.ClienteHandler) *mux.Router {
	r := mux.NewRouter()

	r.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello World!"))
	})
	r.HandleFunc("/clientes", Adapt(
		http.HandlerFunc(clientesHandler.Create),
		controller.MiddlewareValidateCliente).
		ServeHTTP)
	return r
}
