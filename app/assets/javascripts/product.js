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
  var clickW = ('#click-btn').outerWidth();
  var imageW = ('.upload-image__prev').outerWidth();
  $('.sellbox-form__upload--drop--box--image').removeAttr('style');
  $('.sellbox-form__upload--drop--post').outerWidth(clickW - imageW);
  readURL(this);
})

  $('#product_price').on('keyup', function(){
    var input= $(this).val();
    var commission = "¥" + input*0.1;
    var profit = "¥" + input*0.9;
    $('.price-group__box--right').append(commission);
    $('.price-group__box--bold--right').append(profit);
  });

  $('#product_price').on('keydown',function(){
    $('.price-group__box--right').empty();
    $('.price-group__box--bold--right').empty();
  });

  // $('.btn-red').on('click', function(){
  //   window.alert("出品が完了しました。");
  // });

});

