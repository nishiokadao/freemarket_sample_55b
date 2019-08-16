$(document).on('turbolinks:load', function(){
  if (window.location.href.match("/details_search") || window.location.href.match("/search_result")) {
    const select = document.getElementById('select-price');
    select.onchange = function(){
      let min = "";
      let max = "";
      let value = document.getElementById("select-price").value;
      let minprice = document.getElementById("min-price");
      let maxprice = document.getElementById("max-price");
      if (value === 'one'){
        min = '300';
        max = '1000';
      }
      else if(value === 'two'){
        min = '1000';
        max = '5000';
      }
      else if(value === 'three'){
        min = '5000';
        max = '10000';
      }
      else if(value === 'four'){
        min = '10000';
        max = '30000';
      }
      else if(value === 'five'){
        min = '30000';
        max = '50000';
      }
      else if(value === 'six'){
        min = '50000';
        max = '';
      }
      document.getElementById("min-price").value = min;
      document.getElementById("max-price").value = max;
    }
  }
});