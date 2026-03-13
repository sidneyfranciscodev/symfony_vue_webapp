import { defineConfig } from "vite";

import vue from "@vitejs/plugin-vue";
import symfonyPlugin from "vite-plugin-symfony";
import path from "path";

export default defineConfig({
    plugins: [vue(), symfonyPlugin()],
    root: "./assets",
    base: "/build/",
    build: {
        outDir: "../public/build",
        emptyOutDir: true,
        manifest: true,
        rollupOptions: {
            input: {
                app: path.resolve(__dirname, "./assets/vue/main.js"),
                public: path.resolve(__dirname, "./assets/twig/main.js"),
            },
        },
    },
    server: {
        strictPort: true,
        port: 5173,
    },
    resolve: {
        alias: {
            "@": path.resolve(__dirname, "./assets"),
        },
    },
});
