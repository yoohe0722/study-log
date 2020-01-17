// $(function(){
//   //始めにjQueryで送信ボタンを無効化する
//   $('.form__submit').prop("disabled", true);

//   //始めにjQueryで必須欄を加工する
//   $('form textarea :required').each(function () {
//       $(this).prev("label").addClass("required");
//   });

//   //入力欄の操作時
//   $('form textarea :required').change(function () {
//       //必須項目が空かどうかフラグ
//       let flag = true;
//       //必須項目をひとつずつチェック
//       $('form textarea :required').each(function(e) {
//           //もし必須項目が空なら
//           if ($('form textarea :required').eq(e).val() === "") {
//               flag = false;
//           }
//       });
//       //全て埋まっていたら
//       if (flag) {
//           //送信ボタンを復活
//           $('.form__submit').prop("disabled", false);
//       }
//       else {
//           //送信ボタンを閉じる
//           $('.form__submit').prop("disabled", true);
//       }
//   });
// });