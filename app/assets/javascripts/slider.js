$(function() {
  $(document).on('turbolinks:load', function(){
    $('.index-slider-contents').slick({
      prevArrow: '<button class ="prev-arrow"><img src="https://www.mercari.com/jp/assets/img/common/jp/top/carousel-prev.png"></button>',
      nextArrow: '<button class ="next-arrow"><img src="https://www.mercari.com/jp/assets/img/common/jp/top/carousel-next.png"></button>',
      autoplay: true,
      autoplaySpeed: 10000,
    });
  });
});