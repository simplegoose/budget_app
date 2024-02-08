// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'jquery'

//= require jquery
//= require jquery_ujs
//= require bootstrap.min
// require turbolinks
//= require_tree .

const hideNotice = () => {
  const notices = document.querySelectorAll('.alert');

  notices.forEach((notice) => {
    if (notice) notice.classList.add('d-none')
  })
}

const toggleMenu = () => {
  if ($('.navigation').hasClass('show')) {
    $('.navigation').animate({ left: '-75vw' }).removeClass('show');
    $('body').animate({ left: '0' }).removeClass('hide');
  } else {
    $('.navigation').animate({ left: '0' }).addClass('show');
    $('body').animate({ left: '75vw' }).addClass('hide');
  }
}
document.addEventListener("turbo:load", () => {
  setInterval(hideNotice, 5000);

  $('.menu-button').on('click', toggleMenu);
});