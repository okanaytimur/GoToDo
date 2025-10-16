# 1. Derleme aşaması
FROM golang:1.25 AS builder

WORKDIR /app
COPY go.mod ./
COPY . .

RUN go mod tidy
RUN go build -o todo-server main.go

# 2. Çalışma aşaması
FROM debian:bookworm-slim

WORKDIR /app
COPY --from=builder /app/todo-server .
#COPY --from=builder /app/todos.db .

EXPOSE 8080
CMD ["./todo-server"]
