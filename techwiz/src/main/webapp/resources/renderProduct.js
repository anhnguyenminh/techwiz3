// parameters:
// product-image
// product-size
// product-title
// product-name
// product-price
// product-detail

$(function(){
  var id = window.location.href.split("?id=")[1];

  $.get("http://10.0.12.80:8080/API/Product", function(data){
    data.forEach((item, i) => {
      if( id == item.id ){
        $("#product-image").attr('src', 'images/products/'+item.imgName)
        $("#product-name").text(item.title);
        $("#product-title").text(item.title);
        $("#product-image").text(item.imgName);
        $("#product-price").text("Price: " + item.price + "$");
        $("#product-detail").text(item.description);
        $("#product-size").text("Size: " + item.size);
      }
    });

  })

})