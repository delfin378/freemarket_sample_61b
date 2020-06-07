$(document).on('turbolinks:load', function(){

  // payjp.jsの初期化
  Payjp.setPublicKey('pk_test_fe63a9d675fba31924799f7e');
  // ボタンのイベントハンドリング
  const btn = document.getElementById("token_submit");
  btn.addEventListener('click', (e) => {
    e.preventDefault();
    // カード情報生成
    const card = {
      number: $('#card_number').val(),
      exp_month: $('#exp_month').val(),
      exp_year: $('#exp_year').val(),
      cvc: $('#cvc').val(),
    };
     // トークン生成
     Payjp.createToken(card, (status, response) => {
      if (status === 200) { //成功した場合
        $("#card_number").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#charge-form").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
        ); //取得したトークンを送信できる状態にします
        $("#charge-form").submit();
        alert("登録が完了しました"); //確認用
      } else {
        alert("カード情報が正しくありません。"); //確認用
      }
    });
  });
})
