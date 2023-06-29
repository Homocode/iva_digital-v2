package controllers

import (
	"context"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"regexp"

	contractV1 "github.com/Homocode/liquidacion-iva-service/api/http/v1/models"
	"github.com/Homocode/liquidacion-iva-service/internal/app/validation"
	"github.com/Homocode/liquidacion-iva-service/pkg/utils"
	"github.com/go-playground/validator/v10"
)

func FromJson(r io.ReadCloser, target interface{}) error {
	d := json.NewDecoder(r)
	e := d.Decode(target)
	return e
}

func MiddlewareValidateCliente(next http.Handler) http.Handler {
	v := validation.Val

	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		var cliente *contractV1.CreateClienteRequest
		err := utils.FromJson(r.Body, &cliente)
		switch {
		case err == io.EOF:
			w.WriteHeader(http.StatusBadRequest)
			w.Write([]byte("[ERROR]: No body content on POST request"))
		case err != nil:
			w.WriteHeader(http.StatusInternalServerError)
			w.Write([]byte("[ERROR]: reading request body. Can´t decode content"))
		}

		v.RegisterValidation("valCuitFormat", valCuitFormat)
		err = v.Struct(cliente)
		if err != nil {
			w.WriteHeader(http.StatusBadRequest)
			w.Write([]byte(fmt.Sprintf("[ERROR] validating JSON:\n%s", err)))
		}

		ctx := context.WithValue(r.Context(), keyCliente{}, cliente)
		r = r.WithContext(ctx)

		next.ServeHTTP(w, r)
	})
}

func valCuitFormat(fl validator.FieldLevel) bool {
	f := fl.Field()

	re := regexp.MustCompile(`[0-9]{2}-[0-9]{8}-[0-9]`)

	matches := re.FindAllString(f.String(), -1)

	return len(matches) == 1
}
