// Category filter
const tabs = document.querySelectorAll('.filter-tab');
const rows = document.querySelectorAll('tbody tr[data-category]');

function filterByCategory(slug) {
  tabs.forEach(t => {
    t.classList.toggle('active', t.dataset.category === slug);
    t.setAttribute('aria-pressed', String(t.dataset.category === slug));
  });

  rows.forEach(row => {
    if (slug === 'all' || row.dataset.category === slug) {
      row.removeAttribute('hidden');
    } else {
      row.setAttribute('hidden', '');
    }
  });

  // Update URL hash
  if (slug === 'all') {
    history.replaceState(null, '', location.pathname);
  } else {
    history.replaceState(null, '', '#' + slug);
  }
}

tabs.forEach(tab => {
  tab.addEventListener('click', () => filterByCategory(tab.dataset.category));
});

// Apply hash filter on load
const hash = location.hash.replace('#', '');
if (hash) {
  const matchingTab = [...tabs].find(t => t.dataset.category === hash);
  if (matchingTab) filterByCategory(hash);
}
