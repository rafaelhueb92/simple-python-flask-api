# Simple Python Flask API

A minimal Flask application demonstrating a simple web server with a form-based user interface.

## Project Structure

```
.
├── dockerfile              # Docker configuration
├── requirements.txt        # Python dependencies
├── README.md              # This file
├── .gitignore             # Git ignore rules
├── src/                   # Application source
│   ├── app.py             # Flask application
│   └── templates/
│       └── name.html      # User input form
└── charts/
    └── flask-app/         # Helm chart for Kubernetes deployment
        ├── Chart.yaml
        ├── values.yaml
        └── templates/
```

## Requirements

- Python 3.10+
- Docker (optional, for containerized deployment)

## Installation

### Local Setup

1. Clone or download this repository
2. Install dependencies:

   ```bash
   pip install -r requirements.txt
   ```

3. Run the application:
   ```bash
   python src/app.py
   ```

The application will be available at `http://localhost:5000`

## Docker Deployment

### Build the Docker image:

```bash
docker build -t flask-beta .
```

To rebuild without cache:

```bash
docker build --no-cache -t flask-beta .
```

### Run the container:

```bash
docker run -p 5000:5000 flask-beta
```

The application will be available at `http://localhost:5000`

## Usage

1. Navigate to `http://localhost:5000` in your browser
2. Enter your name in the form
3. Click "Get Started"

## Features

- Clean, modern UI with gradient design
- Responsive form interface
- Dockerized for easy deployment
- Multi-stage Docker build for optimized images

## Configuration

The Flask app runs on:

- **Host**: `0.0.0.0` (all interfaces)
- **Port**: `5000`
- **Debug**: Enabled (can be disabled in production)

## Kubernetes Deployment

This project includes a Helm chart for Kubernetes deployment.

### Prerequisites

- Kubernetes cluster (1.20+)
- Helm 3.0+

### Deployment

1. Install the Helm chart:

```bash
helm install flask-app ./charts/flask-app
```

2. Access the application:

```bash
kubectl port-forward svc/flask-app 5000:5000
```

The application will be available at `http://localhost:5000`

### Configuration

Customize the deployment by modifying `charts/flask-app/values.yaml`:

- **replicaCount**: Number of pod replicas (default: 1)
- **image.repository**: Docker image repository
- **image.tag**: Docker image tag (default: latest)
- **service.port**: Service port (default: 5000)
- **ingress.hosts**: Ingress host configuration (default: flask-app.test.com)
- **resources**: CPU and memory limits

### Example with Custom Values

```bash
helm install flask-app ./charts/flask-app \
  --set replicaCount=3 \
  --set image.tag=v1.0
```

## Development

To modify the application:

- Edit `src/app.py` for backend logic
- Edit `src/templates/name.html` for frontend UI

Rebuild the Docker image after making changes:

```bash
docker build --no-cache -t flask-beta .
```

## License

This project is open source and available for educational purposes.
