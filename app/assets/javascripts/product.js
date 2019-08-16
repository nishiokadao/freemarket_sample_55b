$(document).on('turbolinks:load', function(){

  // 複数表示
  var dropzone = $('.dropzone-area');
  var dropzone2 = $('.dropzone-area2');
  var images = [];
  var inputs  =[];
  var input_area = $('.input_area');
  var preview = $('#preview');
  var preview2 = $('#preview2');

  $(document).on('change', 'input[type= "file"].upload-image',function(event){
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_view"><img></div>`);
    reader.onload = function(e) {
      var btn_wrapper = $('<div class="upload-image__prev--btn"><div class="edit-btn">編集</div><div class="delete-btn">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    images.push(img);
    console.log(images);
    console.log(inputs)

    if(images.length >= 5) {
      dropzone2.css({
        'display': 'block'
      })
      dropzone.css({
        'display': 'none'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
        dropzone2.css({
          'width': `calc(100% - (120px * ${images.length - 5}))`
        })
      })
      if(images.length == 9) {
        dropzone2.find('p').replaceWith('<p>ここをクリック</p>')
      }
    } else {
        $('#preview').empty();
        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview.append(image);
        })
        dropzone.css({
          'width': `calc(100% - (120px * ${images.length}))`
        })
      }
      if(images.length == 4) {
        dropzone.find('p').replaceWith('<p>ここをクリック</p>')
      }
    if(images.length == 10) {
      dropzone2.css({
        'display': 'none'
      })
      return;
    }
    // 新しいインプットの表示
    var new_image = $(`<input id="upload-image__btn" class="upload-image" data-image= ${images.length} type="file" name="product[images_attributes][${images.length}][image]">`);
    input_area.prepend(new_image);
  });

  // 削除
  $(document).on('click', '.delete-btn', function() {
    var target_image = $(this).parent().parent();
    $.each(inputs, function(index, input){
      if ($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove();
        var num = $(this).data('image');
        images.splice(num, 1);
        inputs.splice(num, 1);
        if(inputs.length == 0) {
          $('input[type= "file"].upload-image').attr({
            'data-image': 0
          })
        }
      }
    })
    $('input[type= "file"].upload-image:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"].upload-image:first').after(input)
    })
    if (images.length >= 5) {
      dropzone2.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        debugger;
        image.attr('data-image', index);
        preview2.append(image);
      })
      dropzone2.css({
        'width': `calc(100% - (120px * ${images.length - 5}))`
      })
      if(images.length == 9) {
        dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
      if(images.length == 8) {
        dropzone2.find('i').replaceWith('<p>ココをクリックしてください</p>')
      }
    } else {
      dropzone.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
      })
      dropzone.css({
        'width': `calc(100% - (120px * ${images.length}))`
      })
    }
    if(images.length == 4) {
      dropzone2.css({
        'display': 'none'
      })
    }
    if(images.length == 3) {
      dropzone.find('i').replaceWith('<p>ココをクリックしてください</p>')
    }
  })

// 編集画面
  var dropZone = $('.dropzone-area')
  var dropZone2 = $('.dropzone-area2')
  var editImg = $('.edit__img');
  var editImages = []
  editImages.push(editImg);
  if(editImages.length <= 4 ){
    dropZone.css({
      'width': `calc(100% - (120px * ${editImg.length}))`
    })
  } else { 
    dropZone.css({
      'width': `calc(100% - (120px * ${editImages.length}))`
    })
  }
// 編集画面の削除
  $(document).on('click', '.update__delete-btn', function() {
    var editImages = $('.update__img-view');
    // var editImages = 
    var target_image = $(this).parent().parent();
    $.each(editImages, function(index, input){
      if ($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove();
        var num = $(this).data('image');
        editImages.splice(num, 1);
        $.each(editImages, function(index, editImage) {
          editImage.attr('data-image', index);
        })
        if(inputs.length == 0) {
          $('input[type= "file"].upload-image').attr({
            'data-image': 0
          })
        }
      }
    })
    $('input[type= "file"].upload-image:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"].upload-image:first').after(input)
    })
    if (images.length >= 5) {
      dropzone2.css({
        'display': 'block'
      })
      $.each(editImages, function(index, editImage) {
        editImage.attr('data-image', index);
        preview2.append(image);
      })
      dropzone2.css({
        'width': `calc(100% - (120px * ${images.length - 5}))`
      })
      if(images.length == 9) {
        dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
      if(images.length == 8) {
        dropzone2.find('i').replaceWith('<p>ココをクリックしてください</p>')
      }
    } else {
      dropzone.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
      })
      dropzone.css({
        'width': `calc(100% - (120px * ${images.length}))`
      })
    }
    if(images.length == 4) {
      dropzone2.css({
        'display': 'none'
      })
    }
    if(images.length == 3) {
      dropzone.find('i').replaceWith('<p>ココをクリックしてください</p>')
    }
  })

  // 手数料・利益表示
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

    // モーダルウィンドウ
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
    .always(function(){
      $('#js__modal-open').removeAttr('disabled');
      $('#js__modal-back--index').removeAttr('disabled');
    })
  });
});


