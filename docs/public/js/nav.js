document.addEventListener('DOMContentLoaded', () => {
  // Theme toggle
  document.querySelector('.theme-toggle')?.addEventListener('click', () => {
    const html = document.documentElement;
    const current = html.getAttribute('data-theme');
    const next = current === 'dark' ? 'light' : 'dark';
    html.setAttribute('data-theme', next);
    localStorage.setItem('theme', next);
  });

  // Mobile menu
  const hamburger = document.querySelector('.nav-hamburger');
  const mobileMenu = document.querySelector('.nav-mobile-menu');
  hamburger?.addEventListener('click', () => {
    const expanded = hamburger.getAttribute('aria-expanded') === 'true';
    hamburger.setAttribute('aria-expanded', String(!expanded));
    mobileMenu?.toggleAttribute('hidden');
  });

  // Copy buttons
  function setSvgContent(btn, type) {
    const svg = btn.querySelector('svg');
    svg.replaceChildren();
    if (type === 'check') {
      const pl = document.createElementNS('http://www.w3.org/2000/svg', 'polyline');
      pl.setAttribute('points', '20 6 9 17 4 12');
      svg.appendChild(pl);
    } else {
      const rect = document.createElementNS('http://www.w3.org/2000/svg', 'rect');
      rect.setAttribute('x', '9'); rect.setAttribute('y', '9');
      rect.setAttribute('width', '13'); rect.setAttribute('height', '13');
      rect.setAttribute('rx', '2'); rect.setAttribute('ry', '2');
      const path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
      path.setAttribute('d', 'M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1');
      svg.appendChild(rect);
      svg.appendChild(path);
    }
  }
  function copyText(text) {
    if (navigator.clipboard && navigator.clipboard.writeText) {
      return navigator.clipboard.writeText(text);
    }
    // Fallback for browsers that block clipboard API
    const ta = document.createElement('textarea');
    ta.value = text;
    ta.style.position = 'fixed';
    ta.style.opacity = '0';
    document.body.appendChild(ta);
    ta.select();
    document.execCommand('copy');
    document.body.removeChild(ta);
    return Promise.resolve();
  }

  document.querySelectorAll('.code-copy').forEach(btn => {
    btn.addEventListener('click', () => {
      const text = btn.getAttribute('data-copy');
      copyText(text).then(() => {
        btn.classList.add('copied');
        setSvgContent(btn, 'check');
        setTimeout(() => {
          btn.classList.remove('copied');
          setSvgContent(btn, 'copy');
        }, 2000);
      }).catch(() => {
        // Silent fail — button stays as-is
      });
    });
  });
});
