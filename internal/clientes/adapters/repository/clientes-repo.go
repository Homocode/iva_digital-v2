package repository

import (
	"gorm.io/gorm"
)

type ClientesRepo struct {
	db *gorm.DB
}

func NewAccountRepo(db *gorm.DB) *ClientesRepo {
	return &ClientesRepo{
		db: db,
	}
}
