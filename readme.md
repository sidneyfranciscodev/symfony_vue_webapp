# Symfony + Vue WebApp Template

Starter template for building full-stack apps with:

- Symfony backend
- Vue 3 frontend
- Vite for bundling
- SCSS styling
- Nginx reverse proxy
- Docker container

---

## Project Structure

root/  → Symfony project + vite config + Node Modules
assets/ → Vue + Stimulus + SCSS  

---

## Installation

### Backend
1. Install Symfony dependencies: `composer install`
2. Configure `.env` file or create `.env.dev`
3. Run dev server: `symfony server:start` or `php -S localhost:8000 -t public`

### Frontend
1. Run `npm install`
2. Run dev server: `npm run dev`
3. Build production: `npm run build` (output to public folder)

### Docker
1. Run `docker build -t app .`
2. Run `docker run -p 8000:8000 app` 

---

## License

This project is licensed under the MIT License.
