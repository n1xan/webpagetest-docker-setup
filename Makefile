# WebPageTest Docker Compose Makefile
# Common commands for managing the WebPageTest Docker setup

.PHONY: help setup up down build logs status restart clean

# Default target
help:
	@echo "WebPageTest Docker Compose Commands:"
	@echo ""
	@echo "  setup    - Build and start all services (recommended for first run)"
	@echo "  up       - Start all services"
	@echo "  down     - Stop all services"
	@echo "  build    - Build all images"
	@echo "  rebuild  - Rebuild and restart all services"
	@echo "  logs     - View logs from all services"
	@echo "  status   - Check status of all services"
	@echo "  restart  - Restart all services"
	@echo "  clean    - Stop services and remove containers, networks, and images"
	@echo ""
	@echo "Examples:"
	@echo "  make setup     # Initial setup and start"
	@echo "  make logs      # View all logs"
	@echo "  make down      # Stop all services"

# Build and start all services (recommended for first run)
setup:
	@echo "🚀 Setting up WebPageTest Docker Compose..."
	@if command -v docker-compose >/dev/null 2>&1; then \
		docker-compose up --build -d; \
	else \
		docker compose up --build -d; \
	fi
	@echo "✅ Setup complete! Server available at http://localhost:4000"

# Start all services
up:
	@if command -v docker-compose >/dev/null 2>&1; then \
		docker-compose up -d; \
	else \
		docker compose up -d; \
	fi

# Stop all services
down:
	@if command -v docker-compose >/dev/null 2>&1; then \
		docker-compose down; \
	else \
		docker compose down; \
	fi

# Build all images
build:
	@if command -v docker-compose >/dev/null 2>&1; then \
		docker-compose build; \
	else \
		docker compose build; \
	fi

# Rebuild and restart all services
rebuild:
	@if command -v docker-compose >/dev/null 2>&1; then \
		docker-compose up --build -d; \
	else \
		docker compose up --build -d; \
	fi

# View logs from all services
logs:
	@if command -v docker-compose >/dev/null 2>&1; then \
		docker-compose logs -f; \
	else \
		docker compose logs -f; \
	fi

# Check status of all services
status:
	@if command -v docker-compose >/dev/null 2>&1; then \
		docker-compose ps; \
	else \
		docker compose ps; \
	fi

# Restart all services
restart:
	@if command -v docker-compose >/dev/null 2>&1; then \
		docker-compose restart; \
	else \
		docker compose restart; \
	fi

# Clean up everything
clean:
	@echo "🧹 Cleaning up Docker resources..."
	@if command -v docker-compose >/dev/null 2>&1; then \
		docker-compose down --rmi all --volumes --remove-orphans; \
	else \
		docker compose down --rmi all --volumes --remove-orphans; \
	fi
	@echo "✅ Cleanup complete!"