import tailwindcss from '@tailwindcss/vite';
import react from '@vitejs/plugin-react';
import path from 'path';
import { defineConfig } from 'vite';

export default defineConfig(() => {
  return {
    base: './',

    plugins: [
      react(),
      tailwindcss(),
      {
        name: 'remove-vite-client-when-hmr-disabled',
        enforce: 'post' as const,
        transformIndexHtml(html: string) {
          if (process.env.DISABLE_HMR !== 'true') return html;

          return html.replace(
            /<script[^>]*src=["']\/@vite\/client["'][^>]*><\/script>\s*/g,
            ''
          );
        },
      },
    ],

    resolve: {
      alias: {
        '@': path.resolve(__dirname, '.'),
      },
    },

    server: {
      // HMR is disabled when DISABLE_HMR is true.
      hmr: process.env.DISABLE_HMR !== 'true',

      // Disable file watching when HMR is disabled.
      watch: process.env.DISABLE_HMR === 'true' ? null : {},
    },
  };
});