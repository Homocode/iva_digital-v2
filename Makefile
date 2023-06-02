up:
	docker compose -f ./build/package/local/docker-compose.yml up

down:
	docker compose -f ./build/package/local/docker-compose.yml down

migrateup:
	migrate -path db/migration -database "postgresql://root:123@localhost:5432/contable?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:123@localhost:5432/contable?sslmode=disable" -verbose down

.PHONY: up down migrateup migratedown 