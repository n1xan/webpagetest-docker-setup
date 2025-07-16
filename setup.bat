@echo off
setlocal enabledelayedexpansion

REM WebPageTest Docker Compose Setup Script for Windows
REM This script will build and start all containers with a single command

echo 🚀 Starting WebPageTest Docker Compose Setup...

REM Check if Docker is available
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Error: Docker is not installed or not in PATH
    exit /b 1
)

REM Check if Docker Compose is available
docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    docker compose version >nul 2>&1
    if !errorlevel! neq 0 (
        echo ❌ Error: Docker Compose is not installed or not in PATH
        exit /b 1
    )
)

echo ✅ Docker and Docker Compose are available

REM Stop any existing containers
echo 🛑 Stopping any existing containers...
docker-compose down >nul 2>&1
if %errorlevel% neq 0 (
    docker compose down >nul 2>&1
)

REM Build and start all services
echo 🏗️  Building and starting all services...
docker-compose --version >nul 2>&1
if %errorlevel% equ 0 (
    docker-compose up --build -d
) else (
    docker compose up --build -d
)

if %errorlevel% neq 0 (
    echo ❌ Error: Failed to start services
    exit /b 1
)

REM Wait for services to be ready
echo ⏳ Waiting for services to be ready...
timeout /t 10 /nobreak >nul

REM Check if services are running
echo 🔍 Checking service status...
docker-compose --version >nul 2>&1
if %errorlevel% equ 0 (
    docker-compose ps
) else (
    docker compose ps
)

echo.
echo 🎉 Setup complete!
echo 📝 WebPageTest Server is available at: http://localhost:4000
echo 🔧 Agent is connected and ready to run tests
echo.
echo To stop all services, run:
echo   docker-compose down
echo   # or
echo   docker compose down
echo.
echo To view logs, run:
echo   docker-compose logs -f
echo   # or
echo   docker compose logs -f

pause