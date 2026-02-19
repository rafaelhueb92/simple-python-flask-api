# Simple Python Flask API

A minimal Flask application demonstrating a simple web server with a form-based user interface.

## Project Structure

```
.
├── dockerfile          # Docker configuration
├── requirements.txt    # Python dependencies
├── README.md          # This file
└── src/
    ├── app.py         # Flask application
    └── templates/
        └── name.html  # User input form
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
