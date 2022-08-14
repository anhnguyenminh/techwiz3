$(function () {
  $("head").append('<link rel="shortcut icon" href="img/favicon.ico" />')
})

function loadAccountData(role){
  $.get("http://10.0.12.80:8080/API/User", function(data){
    var accData = "";
    data.forEach((item) => {

      if (item.roleId == role && role == 1) {
        accData += `
                   <tr>
                       <td>${item.fullname}</td>
                       <td>${item.email}</td>
                       <td>${item.password}</td>
                       <td>${item.phoneNumber}</td>
                       <td>${item.createdAt}</td>
                       <td>${item.updateAt}</td>
                       <th>
                         <a href="updateAccount.html?id=${item.id}&role=${item.roleId}"><button type="button" class="btn btn-primary">Update</button></a>
                         <a href="updateAccount.html?id=${item.id}&role=${item.roleId}"><button type="button" class="btn btn-warning">Delete</button></a>
                       </th>
                   </tr>
                  `
      } else if (item.roleId == role && role == 2) {
        accData += `
                  <tr>
                      <td>${item.fullname}</td>
                      <td>${item.email}</td>
                      <td>${item.password}</td>
                      <td>${item.phoneNumber}</td>
                      <td>${item.address}</td>
                      <td>${item.createdAt}</td>
                      <th>
                        <a href="updateAccount.html?id=${item.id}&role=${item.roleId}"><button type="button" class="btn btn-primary">Update</button></a>
                        <a href="updateAccount.html?id=${item.id}&role=${item.roleId}"><button type="button" class="btn btn-warning">Delete</button></a>
                      </th>
                  </tr>
                 `
      }
    })
    switch (role) {
      case 1:
        $("#admAccData").html(accData);
        break;
      case 2:
        $("#usrAccData").html(accData);
        break;
      default:
        $("#admAccData").html("<p>No account found</p>");
        $("#usrAccData").html("<p>No account found</p>");
    };
  })

}

function loadRole(){
  $.get("http://10.0.12.80:8080/API/Role", function(data){
    var roleData = "";
    data.forEach((item) => {

      roleData += `
               <tr>
                   <td>${item.id}</td>
                   <td>${item.name}</td>
                   <th>
                       <button type="button" class="btn btn-primary">Update</button>
                       <button type="button" class="btn btn-warning">Delete</button>
                   </th>
               </tr>
              `
    })
    $("#roleData").html(roleData)
  })
}

$("#statusData").ready(function(){
  $.get("http://10.0.12.80:8080/API/Status", function(data){
    var statusData = "";
    data.forEach((item) => {

      statusData += `
               <tr>
                   <td>${item.id}</td>
                   <td>${item.statusName}</td>
                   <th>
                       <button type="button" class="btn btn-primary">Update</button>
                       <button type="button" class="btn btn-warning">Delete</button>
                   </th>
               </tr>
              `
    })
    $("#statusData").html(statusData)
  })
})

$("#categoryData").ready(function(){
  $.get("http://10.0.12.80:8080/API/Category", function(data){
    var categoryData = "";
    data.forEach((item) => {

      categoryData += `
               <tr>
                   <td>${item.id}</td>
                   <td>${item.name}</td>
                   <th>
                       <button type="button" class="btn btn-primary">Update</button>
                       <button type="button" class="btn btn-warning">Delete</button>
                   </th>
               </tr>
              `
    })
    $("#categoryData").html(categoryData)
  })
})

$("#productsData").ready(function(){
  $.get("http://10.0.12.80:8080/API/Product", function(data){
    var productaData = "";
    data.forEach((item) => {

      productaData += `
               <tr>
                 <td>${item.title}</td>
                 <td>${item.categoryId.name}</td>
                 <td>${item.size}</td>
                 <td>${item.price}</td>
                 <td>${item.description}</td>
                 <td>${item.imgName}</td>
                   <th>
                       <button type="button" class="btn btn-primary">Update</button>
                       <button type="button" class="btn btn-warning">Delete</button>
                   </th>
               </tr>
              `
    })
    $("#productsData").html(productaData)
  })
})

$("#soldProductData").ready(function(){
  $.get("http://10.0.12.80:8080/API/Orderdetail", function(data){
    var soldProductaData = "";
    data.forEach((item) => {
      soldProductaData += `
     <tr>
         <td class="align-middle">${item.orderId.userId.fullname}</td>
         <td class="align-middle">${item.orderId.name}</td>
         <td class="align-middle">${item.orderId.userId.phoneNumber}</td>
         <td class="align-middle">${item.orderId.orderDate}</td>
         <td class="align-middle">${item.orderId.address}</td>
         <td class="align-middle">${item.orderId.phone}</td>
         <!-- ordered products list -->
         <td class="align-middle"><img width="100px" src="../images/products/${item.productId.imgName}" alt="product">   </td>
         <td class="align-middle">${item.num * item.price}</td>
         <td class="align-middle">
             <button type="button" class="btn btn-primary mb-5">Update</button>
             <button type="button" class="btn btn-warning mb-5">Delete</button>
         </td>
     </tr>              `
    })
    $("#soldProductData").html(soldProductaData)
  })
})

$("#commentsData").ready(function(){
  $.get("http://10.0.12.80:8080/API/Comment", function(data){
    var commentsData = "";
    data.forEach((item) => {

      commentsData += `
     <tr>
         <td class="align-middle">${item.userId.fullname}</td>
         <td class="align-middle">${item.note}</td>
         <td class="align-middle">${item.commentDate}</td>
         <td class="align-middle">
             <button type="button" class="btn btn-primary mb-5">Update</button>
             <button type="button" class="btn btn-warning mb-5">Delete</button>
         </td>
     </tr>
     `
    })
    $("#commentsData").html(commentsData)
  })
})


$("#contactData").ready(function(){
  $.get("http://10.0.12.80:8080/API/Contact", function(data){
    var contactData = "";
    data.forEach((item) => {
      contactData += `
     <tr>
         <td class="align-middle">${item.name}</td>
         <td class="align-middle">${item.email}</td>
         <td class="align-middle">${item.description}</td>
         <td class="align-middle">
             <button type="button" class="btn btn-primary mb-5">Update</button>
             <button type="button" class="btn btn-warning mb-5">Delete</button>
         </td>
     </tr>
     `
    })
    $("#contactData").html(contactData)
  })
})





