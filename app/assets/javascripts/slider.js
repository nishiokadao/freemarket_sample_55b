$(function() {
  // $('.thumbnail').slick({
  // infinite: true, //スライドのループ有効化
  // arrows: false, //矢印非表示
  // fade: true, //フェードの有効化
  // draggable: false //ドラッグ操作の無効化
  // });
  // $('.thumbnail-thumb').slick({
  // infinite: true, //スライドのループ有効化
  // slidesToShow: 8, //表示するスライドの数
  // focusOnSelect: true, //フォーカスの有効 化
  // asNavFor: '.thumbnail', //thumbnailクラスのナビゲーション
  // });
  $('.slider-contents').slick({
    // arrows: true,
    dots: true,
    cssEase: 'ease',
    dotsClass: 'dot-class',
    prevArrow: '<button class ="prev-arrow"><img src="https://www.mercari.com/jp/assets/img/common/jp/top/carousel-prev.png"></button>',
    nextArrow: '<button class ="next-arrow"><img src="https://www.mercari.com/jp/assets/img/common/jp/top/carousel-next.png"></button>'
    // asNavFor:'.thumbnail-thumb',
  });
  // $('.thumbnail-thumb').slick({
  //   asNavFor:'.thumbnail',
  //   focusOnSelect: true,
  //   arrows:false,
  //   slidesToShow:6,
  //   slidesToScroll:1
  // });    
});