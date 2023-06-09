package utils

import (
	"encoding/json"
	"io"
)

func FromJson(r io.ReadCloser, target interface{}) error {
	d := json.NewDecoder(r)
	e := d.Decode(target)
	return e
}
