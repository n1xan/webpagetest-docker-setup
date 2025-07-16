# WebPageTest Docker Compose Setup

This project has been refactored to use Docker Compose for easier setup and management. You can now start all containers with a single command!

## Quick Start

### Option 1: Using the setup script (Recommended)
```bash
./setup.sh
```

### Option 2: Using Docker Compose directly
```bash
docker-compose up --build -d
```

## What's Included

The Docker Compose setup includes:

- **WebPageTest Server**: Available at `http://localhost:4000`
- **WebPageTest Agent**: Automatically connects to the server and runs tests
- **Health Checks**: Ensures the agent starts only after the server is ready
- **Automatic Restarts**: Services restart automatically if they fail

## Configuration

### Environment Variables

Copy `.env.example` to `.env` and customize as needed:

```bash
cp .env.example .env
```

Available configuration options:

- `SERVER_PORT`: Port for the WebPageTest server (default: 4000)
- `SERVER_URL`: URL the agent uses to connect to the server
- `LOCATION`: Test location name (default: Test)
- `NAME`: Optional custom name for the agent
- `AGENT_NETWORK_MODE`: Network mode for the agent (default: host)

### Custom Configuration Files

The setup uses the existing configuration files:
- `server/locations.ini`: Server location configuration
- `agent/script.sh`: Agent startup script

## Common Commands

### Start all services
```bash
docker-compose up -d
```

### Stop all services
```bash
docker-compose down
```

### View logs
```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f wptserver
docker-compose logs -f wptagent
```

### Rebuild and restart
```bash
docker-compose up --build -d
```

### Check service status
```bash
docker-compose ps
```

## Migration from Previous Setup

### Old Setup (Multiple Scripts)
Previously, you had to run:
```bash
./build-docker-images.sh
./start-server-and-agent.sh
```

### New Setup (Single Command)
Now you can run:
```bash
./setup.sh
```

The old scripts are still available if needed, but the Docker Compose setup is recommended for easier management.

## Troubleshooting

### Services not starting
1. Check if ports are available: `netstat -tulpn | grep :4000`
2. View logs: `docker-compose logs`
3. Restart services: `docker-compose restart`

### Agent not connecting to server
1. Check if the server is healthy: `docker-compose ps`
2. Verify the SERVER_URL in your `.env` file
3. Check agent logs: `docker-compose logs wptagent`

### Permission issues
Make sure the setup script is executable:
```bash
chmod +x setup.sh
```

## Development

### Modifying configurations
After changing configuration files, rebuild and restart:
```bash
docker-compose up --build -d
```

### Adding new services
Edit `docker-compose.yml` and add new services as needed.

## Support

For issues with the Docker Compose setup, check:
1. Docker and Docker Compose are installed
2. Ports 4000 and 4001 are available
3. Docker daemon is running
4. User has permissions to run Docker commands