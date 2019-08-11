$(document).on('turbolinks:load', function(){

  // あとで使う
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

  var modalWindow = 
  ` <div class="js__modal-buy>
      <div class ="js__model-buy--back">
        <div class="modal-content">
          <h3 class="modal-head"> 出品が完了しました</h3>
          <div class="modal-content_body">あなたが出品した商品は「出品した商品一覧」からいつでも見ることができます。</div>
        </div>
      </div>
    </div>
  `

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
      $('.js__modal-buy').removeAttr('style');
      $('#js__modal-close').on('click', function(){
        $('.js__modal-buy').fadeOut();
      });
      $('.new_message')[0].reset();
    })
    .fail(function(){
      alert("入力されていない項目があります。");
    })
  
  
  });


});

