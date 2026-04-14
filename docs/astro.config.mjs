import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://designwithintent.ai',
  base: '/',
  trailingSlash: 'always',
  build: {
    assets: 'assets',
  },
});
