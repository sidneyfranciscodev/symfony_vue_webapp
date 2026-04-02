# Symfony + Vue WebApp Template

A modern full-stack web application starter template combining Symfony backend with Vue 3 frontend. Perfect for rapid development of interactive web applications with professional architecture and tooling.

## Tech Stack

- **Backend**: Symfony 7 framework with PHP 8.3
- **Frontend**: Twig SSR with Stimulus + Vue 3 SPA with Composition API
- **Build Tool**: Vite for fast development and optimized production builds
- **Styling**: SCSS with organized structure
- **Containerization**: Docker & Docker Compose
- **Reverse Proxy**: Nginx

## Prerequisites

- PHP 8.3 with required extensions (intl, zip, pdo, pdo_postgres, etc.)
- Node.js 20+ and npm
- Docker & Docker Compose (for containerized setup)
- Composer for PHP dependency management

## Project Structure

```
├── assets/              # Frontend assets (Vue, Twig, styles)
│   ├── vue/            # Vue 3 application
│   ├── twig/           # Twig template assets
│   └── axios/          # API client configuration
├── src/                # Backend PHP code
│   ├── Controller/     # Symfony controllers
│   ├── Entity/         # Doctrine entities
│   └── Repository/     # Data repositories
├── public/             # Web root (index.php, built assets)
├── templates/          # Twig templates
├── config/             # Symfony configuration
├── migrations/         # Database migrations
└── nginx/              # Nginx configuration & Docker setup
```

## Quick Start

### Option 1: Local Development (Recommended for Development)

**Backend Setup**
1. Install PHP dependencies:
   ```bash
   composer install
   ```
2. Create `.env.local` and configure database:
   ```
   APP_ENV=dev
   DATABASE_URL="mysql://user:password@localhost/dbname"
   ```
3. Run migrations (if using database):
   ```bash
   php bin/console doctrine:migrations:migrate
   ```
4. Start the Symfony dev server:
   ```bash
   symfony server:start
   # or
   php -S localhost:8000 -t public
   ```

**Frontend Setup**
1. Install Node dependencies:
   ```bash
   npm install
   ```
2. Start the development server:
   ```bash
   npm run dev
   ```
3. For production builds:
   ```bash
   npm run build
   ```
   Built assets are output to the `public/build/` folder.

### Option 2: Docker Setup (Recommended for Production)
**Using Dockerfile**
```bash
docker build -t symfony-vue-app .
docker run -p 8000:80 symfony-vue-app
```

**Using Docker Compose (All-in-one)**
1. First make sure to build vue assets to `public/` folder.
2. Copy the `public` folder to `nginx/` folder so nginx can serve static files.

3. Run `docker compose up`
This starts:
- Symfony backend
- Nginx reverse proxy (port 80:80)
- Database (if configured in compose.yaml)

Environment: `APP_ENV=prod`

## Environment Configuration

Create a `.env.local` file in the root directory (for local development):

```env
APP_ENV=dev
APP_DEBUG=1
DATABASE_URL="mysql://user:pass@db:3306/dbname"
```

For production, modify in `.env` or pass via environment variables.

## Development Workflow

### Running Both Frontend and Backend

**Terminal 1 - Backend:**
```bash
symfony server:start
```

**Terminal 2 - Frontend:**
```bash
npm run dev
```

The frontend dev server will typically run on `http://localhost:5173` and proxy API requests to your backend.

## Available Scripts

**Frontend Scripts** (see `package.json`)
- `npm run dev` - Start development server with HMR
- `npm run build` - Build optimized production bundle
- `npm run preview` - Preview production build locally

**Backend Commands** (Symfony Console)
- `php bin/console serve` - Start local dev server
- `php bin/console cache:clear` - Clear application cache
- `php bin/console doctrine:migrate` - Run database migrations
- `php bin/console make:controller` - Generate new controller

## API Integration

The frontend connects to the backend via:
- API endpoint configured in `assets/axios/index.js`
- Controllers in `src/Controller/` handle API requests
- Twig templates in `templates/` for server-side rendering

## Styling Architecture

SCSS files are organized by purpose:
- `abstracts/` - Mixins and variables
- `base/` - Global styles and resets
- `components/` - Reusable component styles
- `view/` - Page-specific styles

Import variables and mixins globally to use across all components.

## Database Migrations

If using Doctrine ORM:

```bash
# Create a new migration
php bin/console make:migration

# Run all pending migrations
php bin/console doctrine:migrations:migrate

# Rollback last migration
php bin/console doctrine:migrations:migrate prev
```

## Troubleshooting

**Frontend assets not loading**
- Ensure `npm run build` has been executed
- Check that Vite manifest is being used by Symfony
- Verify `public/build/` directory exists

**Symfony server won't start**
- Check if port 8000 is already in use
- Ensure PHP version meets requirements (8.1+)
- Review `.env` configuration

**Docker build fails**
- Ensure Docker daemon is running
- Check `Dockerfile` for PHP extension requirements
- Verify `.dockerignore` isn't excluding necessary files

**Database connection issues**
- Verify `DATABASE_URL` in `.env.local`
- Ensure database service is running (if using Docker)
- Check database credentials and permissions

## Contributing

1. Create a feature branch: `git checkout -b feature/your-feature`
2. Make your changes and test locally
3. Commit with clear messages
4. Push to your branch
5. Open a pull request

## License

This project is licensed under the MIT License. See LICENSE file for details.
