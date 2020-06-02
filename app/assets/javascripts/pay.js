// DOM読み込みが完了したら実行
document.addEventListener(
  'DOMContentLoaded', (e) => {
  // payjp.jsの初期化
  Payjp.setPublicKey('pk_test_fe63a9d675fba31924799f7e');
  
  // ボタンのイベントハンドリング
  let btn = document.getElementById("token_submit");
  btn.addEventListener('click', (e) => {
    e.preventDefault();
    // カード情報生成
    let card = {
      number: document.getElementById('card_number').value,
      exp_month: document.getElementById('exp_month').value,
      exp_year: document.getElementById('exp_year').value,
      cvc: document.getElementById('cvc').value,
    };
     // トークン生成
     Payjp.createToken(card, (status, response) => {
      if (status === 200) { //成功した場合
        $("#number").removeAttr("name");
        $("#month").removeAttr("name");
        $("#year").removeAttr("name");
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
}, false);