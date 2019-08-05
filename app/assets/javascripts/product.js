$(document).on('turbolinks:load', function(){


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

