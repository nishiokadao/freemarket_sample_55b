$(document).on('turbolinks:load', function(){

  // $('.sellbox-form__upload--drop--post').on('click', function(){
  //   $('#post_image').click();
  // });
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

});

