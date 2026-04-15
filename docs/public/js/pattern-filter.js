document.addEventListener('DOMContentLoaded', () => {
  const tabs = document.querySelectorAll('.filter-tab');
  const rows = document.querySelectorAll('tbody tr[data-category]');
  const select = document.querySelector('.filter-select');

  function filterByCategory(slug) {
    tabs.forEach(t => {
      t.classList.toggle('active', t.dataset.category === slug);
      t.setAttribute('aria-pressed', String(t.dataset.category === slug));
    });

    if (select) select.value = slug;

    rows.forEach(row => {
      row.classList.remove('last-visible');
      if (slug === 'all' || row.dataset.category === slug) {
        row.removeAttribute('hidden');
      } else {
        row.setAttribute('hidden', '');
      }
    });

    const visible = [...rows].filter(r => !r.hasAttribute('hidden'));
    if (visible.length) visible[visible.length - 1].classList.add('last-visible');

    if (slug === 'all') {
      history.replaceState(null, '', location.pathname);
    } else {
      history.replaceState(null, '', '#' + slug);
    }
  }

  tabs.forEach(tab => {
    tab.addEventListener('click', () => filterByCategory(tab.dataset.category));
  });

  if (select) {
    select.addEventListener('change', () => filterByCategory(select.value));
  }

  // Mark last visible on initial load
  const lastRow = rows[rows.length - 1];
  if (lastRow) lastRow.classList.add('last-visible');

  // Apply hash filter on load
  const hash = location.hash.replace('#', '');
  if (hash) {
    const matchingTab = [...tabs].find(t => t.dataset.category === hash);
    if (matchingTab) filterByCategory(hash);
  }
});
