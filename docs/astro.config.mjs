import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://ghaida.github.io',
  base: '/intent',
  build: {
    assets: '_assets',
  },
});
