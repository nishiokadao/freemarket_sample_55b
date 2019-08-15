$(document).on('turbolinks:load', function(){
  if (window.location.href.match(/\/products\/exhibit\/\d+/)) {
    let modal_open = document.getElementById('modal_open')
    let modal_close = document.getElementById('modal-close-btn')
    modal_open.onclick = function () {
      $('#overlay').fadeIn();
    };
    modal_close.onclick = function () {
      $('#overlay').fadeOut();
    };
  };
});