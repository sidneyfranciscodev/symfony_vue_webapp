# Symfony + Vue WebApp Template

Starter template for building full-stack apps with:

- Symfony backend
- Vue 3 frontend
- Vite for bundling
- SCSS styling
- nginx config
- Dockerfile

---

## Project Structure

root/  → Symfony project + Vite config + NPM packages
assets/ → Vue + Stimulus + SCSS  

---

## Installation

### Backend
1. Install Symfony dependencies: `composer install`
2. Configure `.env` file
3. Run dev server: `symfony server:start` or `php -S localhost:8000 -t public`

### Frontend
1. Run `npm install`
2. Run dev server: `npm run dev`
3. Build production: `npm run build` (output to public folder)

---

## License

This project is licensed under the MIT License.