$(function() {
  $(document).on('turbolinks:load', function(){
    $('.item-slider-content__slider').slick({
      arrows:false,
      asNavFor:'.item-slider-content__thumbnail',
    });
    $('.item-slider-content__thumbnail').slick({
      asNavFor:'.item-slider-content__slider',
      focusOnSelect: true,
      arrows:false,
      slidesToShow:4,
      slidesToScroll:1
    });    
  });
});