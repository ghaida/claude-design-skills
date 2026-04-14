import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://ghaida.github.io',
  base: '/intent',
  trailingSlash: 'always',
  build: {
    assets: 'assets',
  },
});
