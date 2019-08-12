$(document).on('turbolinks:load', function(){

  var postBtn = document.getElementById('click-btn');

  postBtn.addEventListener('click', function(){
    $('#post__image').click();
  });

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.upload-image__prev--figure--src').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $('#post__image').change(function(){
    $('.sellbox-form__upload--drop--box--image').removeAttr('style');
    readURL(this);
  });

  $('#product_price').on('keyup', function(){
    var input= $(this).val();
    var commission = "¥" + Math.round(input*0.1);
    var profit = "¥" + Math.round(input*0.9);
    $('.price-group__box--right').append(commission);
    $('.price-group__box--bold--right').append(profit);
  });

  $('#product_price').on('keydown',function(){
    $('.price-group__box--right').empty();
    $('.price-group__box--bold--right').empty();
  });

  $('#new_product').on('submit', function(e){
    e.preventDefault();
    var product = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: product,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(){
      $('.js__modal-buy').show();
      $('#js__modal-close').on('click', function(){
        $('.js__modal-buy').fadeOut();
      })
    })
    .fail(function(){
      alert('入力されていない項目があります。');
    })
  });
});


