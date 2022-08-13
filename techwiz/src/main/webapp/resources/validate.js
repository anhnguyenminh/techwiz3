$(function(){


  $("#submitBtn").click(function(){
    var check = 1;

    if( !emailCheck( $("#email").val()) ){
      $("#emailErr").text("Invalid Email");
      check = 0;
    }else if( !$("#email").val() ){
      $("#emailErr").text("Email is required");
      check = 0;
    }else{
      $("#emailErr").text("");
    }

    if( !passCheck( $("#password").val(), $("#repassword").val() )){
      $("#repassErr").text("Password does not matched");
      check = 0;
    }
    if( !$("#password").val() ){
      $("#repassErr").text("Password is required");
      check = 0;
    }else{
      $("#repassErr").text("");
    }

    if( !passCheck( $("#password").val(), $("#repassword").val() )){
      $("#repassErr").text("Password does not matched");
      check = 0;
    }else{
      $("#repassErr").text("");
    }


    if( check == 1 ){
      $('form').submit();
    }
  })

})

function emailCheck(email){
  var pattern = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return pattern.test(email);
}

function passCheck(pass,repass){
  res = (pass == repass) ? true : false ;
  return res;
}