// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const hideNotice = () => {
  const notices = document.querySelectorAll('.alert');

  notices.forEach((notice) => {
    if (notice) notice.classList.add('d-none')
  })
}
document.addEventListener("turbo:load", () => {
  setInterval(hideNotice, 5000);
});