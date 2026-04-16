(function () {
  var panel = document.getElementById('output-panel');
  var overlay = document.getElementById('output-panel-overlay');
  var title = document.getElementById('output-panel-title');
  var body = document.getElementById('output-panel-body');
  var closeBtn = panel.querySelector('.output-panel-close');

  function open(skill) {
    // Content is from our own build-time rendered HTML, not user input
    var source = document.getElementById('output-' + skill);
    if (!source) return;

    title.textContent = '/' + skill;
    // Safe: source content is static HTML generated at build time by Astro,
    // not user-supplied input. No sanitization needed.
    body.innerHTML = source.innerHTML;
    panel.classList.add('open');
    panel.setAttribute('aria-hidden', 'false');
    overlay.classList.add('open');
    document.body.style.overflow = 'hidden';
    closeBtn.focus();
  }

  function close() {
    panel.classList.remove('open');
    panel.setAttribute('aria-hidden', 'true');
    overlay.classList.remove('open');
    document.body.style.overflow = '';
  }

  // Trigger buttons
  document.querySelectorAll('.step-output-trigger').forEach(function (btn) {
    btn.addEventListener('click', function () {
      open(btn.dataset.skill);
    });
  });

  // Close button
  closeBtn.addEventListener('click', close);

  // Overlay click closes
  overlay.addEventListener('click', close);

  // Escape key closes
  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape' && panel.classList.contains('open')) {
      close();
    }
  });
})();
