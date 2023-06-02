# Build stage
FROM golang:1.19-alpine3.18 AS builder
WORKDIR /app
COPY . .
RUN go build -o main  cmd/main.go
RUN apk add curl
RUN curl -L https://github.com/golang-migrate/migrate/releases/download/v4.15.2/migrate.linux-amd64.tar.gz | tar xvz

# Run stage
FROM alpine:3.18
WORKDIR /app
COPY --from=builder /app/main /app/   
COPY --from=builder /app/migrate ./migrate
COPY ./infrastructure/local/.env /app/
COPY ./infrastructure/local/start.sh /app/
COPY ./infrastructure/local/wait-for.sh /app/ 
COPY ./db/migration ./migration

EXPOSE 8080

ENTRYPOINT [ "/app/start.sh" ]
CMD ["/app/main"]