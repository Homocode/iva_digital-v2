package validation

import "github.com/go-playground/validator/v10"

var Val *validator.Validate

func SetValidator() {
	v := validator.New()
	Val = v
}
