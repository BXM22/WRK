# Load .env (if present) and export its vars to every recipe.
-include .env
export

MIGRATIONS_DIR := backend/migrations

.PHONY: help db-up db-down db-reset db-logs psql migrate-up migrate-down migrate-down-all migrate-version migrate-new check-db-url

help:
	@echo "db-up             Start Postgres (docker compose) and wait until healthy"
	@echo "db-down           Stop Postgres (data volume is kept)"
	@echo "db-reset          Stop Postgres AND delete its data volume"
	@echo "db-logs           Tail Postgres logs"
	@echo "psql              Open psql inside the Postgres container"
	@echo "migrate-up        Apply all pending migrations"
	@echo "migrate-down      Roll back the most recent migration"
	@echo "migrate-down-all  Roll back every migration"
	@echo "migrate-version   Show the current migration version"
	@echo "migrate-new name=<name>  Create a new up/down migration pair"

db-up:
	docker compose up -d --wait db

db-down:
	docker compose down

db-reset:
	docker compose down -v

db-logs:
	docker compose logs -f db

psql:
	docker compose exec db psql -U $(POSTGRES_USER) -d $(POSTGRES_DB)

check-db-url:
	@test -n "$(DATABASE_URL)" || (echo "DATABASE_URL is not set (copy .env.example to .env)"; exit 1)

migrate-up: check-db-url
	migrate -path $(MIGRATIONS_DIR) -database "$(DATABASE_URL)" up

migrate-down: check-db-url
	migrate -path $(MIGRATIONS_DIR) -database "$(DATABASE_URL)" down 1

migrate-down-all: check-db-url
	migrate -path $(MIGRATIONS_DIR) -database "$(DATABASE_URL)" down -all

migrate-version: check-db-url
	migrate -path $(MIGRATIONS_DIR) -database "$(DATABASE_URL)" version

migrate-new:
	@test -n "$(name)" || (echo "usage: make migrate-new name=<name>"; exit 1)
	migrate create -ext sql -dir $(MIGRATIONS_DIR) -seq -digits 6 $(name)
