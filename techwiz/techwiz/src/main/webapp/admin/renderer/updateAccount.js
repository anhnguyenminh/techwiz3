
var data = window.location.href.split("?")[1].split("&");

var id = data[0].split("=")[1]
var role = data[1].split("=")[1]

var accForm = `
  <label for="">Name</label>
  <input type="text" class="form-control form-control-user" id="name" name="fullname">
  <input type="hidden" id="id" name="id" value="${id}">
  <label for="">Email</label>
  <input type="email" class="form-control form-control-user" id="email" name="email" readonly>
  <span class="error" id="emailErr"></span>
  <label for="">Phone</label>
  <input type="tel" class="form-control form-control-user" id="phone" name="phone_number">
  <label for="">Address</label>
  <input type="text" class="form-control form-control-user" id="address" name="address">
  <label for="">Password</label>
  <input type="password" class="form-control form-control-user" id="password" name="password">
  <label for="">Confirm Password</label>
  <span class="error" id="repassErr"></span>

  <input type="password" class="form-control form-control-user" id="repassword" name="repassword">
  <button id="submitBtn" type="button" class="btn btn-primary mt-2 m-2">Update</button>
`;

$(function(){
  $("#account-form").html(accForm)

})

$.get("http://10.0.12.94:8080/API/User", function(data){
  data.forEach((item, i) => {
    if( item.id == id && item.roleId == role ){
      $("#name").val(item.fullname)
      $("#id").val(item.id)
      $("#email").val(item.email)
      $("#phone").val(item.phoneNumber)
      $("#address").val(item.address)
    }
  });


})