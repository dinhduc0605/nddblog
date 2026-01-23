// Modern Blog JavaScript
// Motion-Driven Minimal interactions

document.addEventListener('DOMContentLoaded', function() {
  initNavigation();
  initScrollAnimations();
  initSearchForm();
});

// Navigation
function initNavigation() {
  const nav = document.getElementById('modernNav');
  if (!nav) return;

  let lastScrollY = window.scrollY;
  let ticking = false;

  window.addEventListener('scroll', function() {
    if (!ticking) {
      window.requestAnimationFrame(function() {
        handleNavScroll(nav, lastScrollY);
        lastScrollY = window.scrollY;
        ticking = false;
      });
      ticking = true;
    }
  });
}

function handleNavScroll(nav, lastScrollY) {
  const currentScrollY = window.scrollY;

  if (currentScrollY > 100) {
    nav.style.background = 'rgba(255, 255, 255, 0.95)';
    nav.style.boxShadow = '0 1px 3px 0 rgb(0 0 0 / 0.1)';
  } else {
    nav.style.background = 'rgba(255, 255, 255, 0.8)';
    nav.style.boxShadow = 'none';
  }
}

function toggleMobileNav() {
  const navLinks = document.getElementById('navLinks');
  if (navLinks) {
    navLinks.classList.toggle('is-open');
  }
}

// Scroll Animations using Intersection Observer
function initScrollAnimations() {
  if (!('IntersectionObserver' in window)) return;

  // Check for reduced motion preference
  const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  if (prefersReducedMotion) return;

  const observerOptions = {
    root: null,
    rootMargin: '0px 0px -50px 0px',
    threshold: 0.1
  };

  const observer = new IntersectionObserver(function(entries) {
    entries.forEach(function(entry) {
      if (entry.isIntersecting) {
        entry.target.classList.add('is-visible');
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  // Observe elements with animation classes
  document.querySelectorAll('.animate-on-scroll, .post-card, .skill-card, .timeline-item, .interest-card').forEach(function(el) {
    observer.observe(el);
  });
}

// Search Form Enhancement
function initSearchForm() {
  const searchForm = document.querySelector('.search-form');
  if (!searchForm) return;

  const searchInput = searchForm.querySelector('.search-input');
  const searchBtn = searchForm.querySelector('.search-btn');

  if (searchBtn && searchInput) {
    searchBtn.addEventListener('click', function() {
      if (searchInput.value.trim()) {
        searchForm.submit();
      } else {
        searchInput.focus();
      }
    });

    searchInput.addEventListener('keypress', function(e) {
      if (e.key === 'Enter') {
        e.preventDefault();
        if (searchInput.value.trim()) {
          searchForm.submit();
        }
      }
    });
  }
}

// Share functionality
function shareOnFacebook() {
  window.open('https://facebook.com/sharer/sharer.php?u=' + encodeURIComponent(window.location.href), '', 'menubar=no,width=500,height=300');
}

function shareOnTwitter() {
  window.open('https://twitter.com/share?url=' + encodeURIComponent(window.location.href), '', 'menubar=no,width=500,height=300');
}

function shareByEmail() {
  window.open('mailto:?subject=' + encodeURIComponent(document.title) + '&body=' + encodeURIComponent(window.location.href));
}

// Like button functionality
function toggleLike(postId) {
  const likeBtn = document.querySelector('.like-button');
  const likeCount = document.querySelector('.like-count');

  if (!likeBtn || !likeCount) return;

  // Toggle liked state
  likeBtn.classList.toggle('liked');

  // Update count (this should be connected to your backend)
  const currentCount = parseInt(likeCount.textContent) || 0;
  if (likeBtn.classList.contains('liked')) {
    likeCount.textContent = currentCount + 1;
  } else {
    likeCount.textContent = Math.max(0, currentCount - 1);
  }

  // Send to server
  fetch('/posts/' + postId + '/toggle_clap', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
    }
  }).catch(function(error) {
    console.error('Error toggling like:', error);
  });
}

// Make functions globally available
window.toggleMobileNav = toggleMobileNav;
window.shareOnFacebook = shareOnFacebook;
window.shareOnTwitter = shareOnTwitter;
window.shareByEmail = shareByEmail;
window.toggleLike = toggleLike;
