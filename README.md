# Laravel with Docker - Single Command Setup

## Prerequisites

Before you begin, ensure you have installed all of the following on your development machine:
- Docker and Docker Compose
- Make (for using the `Makefile` commands)


## Getting Started

To get your Dockerized Laravel environment up and running, follow these steps:

1. **Clone the Repository**

   Start by cloning this repository to your local machine:

   ```sh
   git clone git@github.com:Anthony14FR/LaravelWithDockerSingleCommandSetup.git
   ```

2. **Run the Setup Command**

   Navigate to the root directory of the cloned repository and run the setup command:

   ```sh
   make setup
   ```

   This command builds the Docker images, creates a new Laravel project, and sets up the environment.

3. **Access Your Laravel Application**

   After the setup is complete, your Laravel application will be accessible at `http://localhost:8080`.


## Features

- **Dockerized Environment**: Includes configurations for `app` (PHP-FPM), `db` (MySQL), and `nginx` as a web server.
- **Automatic Laravel Installation**: Automates the installation and setup of a new Laravel project.
- **Environment Customization**: Easy customization through `.env` files and Docker Compose configurations.
- **Simplified Commands**: Utilizes a `Makefile` for common tasks such as setup, teardown, and environment management.


## Makefile Commands

The `Makefile` includes several commands to simplify the management of your Docker environment:

- `make setup`: Initializes the environment and sets up the Laravel project.
- `make build`: Builds or rebuilds services defined in `docker-compose.yml`.
- `make down`: Stops and removes containers, networks, and volumes.
- `make reload`: Stops all services and starts them again.
- `make key-generate`: Generates a new application key for Laravel.
- `make migrate`: Runs the database migrations.

## Customization

You can customize your Laravel and Docker setup by editing the `.env` files for Laravel and modifying the `docker-compose.yml` file according to your requirements.

## Troubleshooting

- If you encounter any issues during the setup process, ensure Docker and Docker Compose are correctly installed and up-to-date.
- Check the Docker and application logs for any errors that might indicate what went wrong.

## License

This project is open-sourced under the MIT License. See the LICENSE file for more information.