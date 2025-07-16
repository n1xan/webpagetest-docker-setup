#!/bin/bash

# WebPageTest Docker Compose Setup Script
# This script will build and start all containers with a single command

set -e

echo "🚀 Starting WebPageTest Docker Compose Setup..."

# Check if Docker and Docker Compose are available
if ! command -v docker &> /dev/null; then
    echo "❌ Error: Docker is not installed or not in PATH"
    exit 1
fi

if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
    echo "❌ Error: Docker Compose is not installed or not in PATH"
    exit 1
fi

echo "✅ Docker and Docker Compose are available"

# Stop any existing containers
echo "🛑 Stopping any existing containers..."
docker-compose down 2>/dev/null || docker compose down 2>/dev/null || true

# Build and start all services
echo "🏗️  Building and starting all services..."
if command -v docker-compose &> /dev/null; then
    docker-compose up --build -d
else
    docker compose up --build -d
fi

# Wait for services to be ready
echo "⏳ Waiting for services to be ready..."
sleep 10

# Check if services are running
echo "🔍 Checking service status..."
if command -v docker-compose &> /dev/null; then
    docker-compose ps
else
    docker compose ps
fi

echo ""
echo "🎉 Setup complete!"
echo "📝 WebPageTest Server is available at: http://localhost:4000"
echo "🔧 Agent is connected and ready to run tests"
echo ""
echo "To stop all services, run:"
echo "  docker-compose down"
echo "  # or"
echo "  docker compose down"
echo ""
echo "To view logs, run:"
echo "  docker-compose logs -f"
echo "  # or"
echo "  docker compose logs -f"