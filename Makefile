.PHONY: db-up db-down db-status

# PostgreSQL container name
DB_CONTAINER = todo-postgres

# PostgreSQL credentials
DB_USER = postgres
DB_PASSWORD = postgres
DB_NAME = postgres
DB_PORT = 5434

db-up:
	@echo "Starting PostgreSQL container..."
	docker run --name $(DB_CONTAINER) \
		-e POSTGRES_USER=$(DB_USER) \
		-e POSTGRES_PASSWORD=$(DB_PASSWORD) \
		-e POSTGRES_DB=$(DB_NAME) \
		-p $(DB_PORT):5432 \
		-d postgres:latest
	@echo "PostgreSQL is running on port $(DB_PORT)"

db-down:
	@echo "Stopping PostgreSQL container..."
	docker stop $(DB_CONTAINER) || true
	docker rm $(DB_CONTAINER) || true
	@echo "PostgreSQL container stopped and removed"

db-status:
	@echo "Checking PostgreSQL container status..."
	docker ps -a | grep $(DB_CONTAINER)

db-logs:
	@echo "Showing PostgreSQL logs..."
	docker logs $(DB_CONTAINER)

db-restart: db-down db-up
	@echo "PostgreSQL container restarted"

# New target for stopping and removing the existing container
stop-and-remove-existing:
	@echo "Stopping and removing existing PostgreSQL container..."
	docker stop task-manager-db-1
	docker rm task-manager-db-1
	@echo "Existing PostgreSQL container stopped and removed"

# New target for starting the PostgreSQL container
start-db:
	@echo "Starting PostgreSQL container..."
	docker run --name $(DB_CONTAINER) \
		-e POSTGRES_USER=$(DB_USER) \
		-e POSTGRES_PASSWORD=$(DB_PASSWORD) \
		-e POSTGRES_DB=$(DB_NAME) \
		-p $(DB_PORT):5432 \
		-d postgres:latest
	@echo "PostgreSQL is running on port $(DB_PORT)" 