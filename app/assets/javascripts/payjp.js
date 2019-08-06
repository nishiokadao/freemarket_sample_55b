document.addEventListener("DOMContentLoaded", (e) => {
  Payjp.setPublicKey("pk_test_12e96021c762e46f94b2f548");
  const btn = document.getElementById('token'); 
  btn.addEventListener("click", (e) => {
    e.preventDefault();

    const card = {
      number: document.getElementById("card_number").value,
      cvc: document.getElementById("cvc").value,
      exp_month: document.getElementById("exp_month").value,
      exp_year: document.getElementById("exp_year").value
    }; 

    Payjp.createToken(card, (status, response) => {
      if (status === 200) { 
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name"); 
        $("#form-inner").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
        ); 
        $("#form-inner").get(0).submit();
        alert("登録が完了しました"); 
      } else {
        alert("カード情報が正しくありません。"); 
      }
    });
  });
},false);