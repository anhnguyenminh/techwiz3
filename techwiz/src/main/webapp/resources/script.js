

function toggleSearchForm(){
  if( $("#search-form").css('display') == "none" ){
    $("#search-form").css('display','inline');
  }else{
    $("#search-form").css('display','none');
  }
};

// add modueles to webpages
$(function(){
  $.get("components/navbar.html", function(data,status){
    $(".navbar").html(data);
  });
  $.get("components/bottom.html", function(data,status){
    $(".bottom-part").html(data);
  });
  // add to head elements
  $("head").append('<meta name="viewport" content="width=device-width, initial-scale=1.0">');
  $("head").append('<link rel="stylesheet" href="resources/style.css">');
  $("head").append('<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">');
})

// validate contect.html
$(function(){
  // check contact name
  $("#contact-name").keyup(function(){
    if( $("#contact-name").val()){
      $("#required-name").hide()
    }else{
      $("#required-name").show()
    }
  })
  // check contact mail
  $("#contact-mail").keyup(function(){
    if( $("#contact-mail").val()){
      $("#required-mail").hide()
    }else{
      $("#required-mail").show()
    }
  })
})


// render data products.html

// render filter
$(".filter").ready(function(){
  var filter = `<span class="filter-btn" id="0">All</span>`
  $.get("http://10.0.12.94:8080/API/Category", function(data){
    data.forEach((item) => {
      filter += `<span class="filter-btn"  onclick="loadCategory(${item.id})">${item.name}</span>`
    });
    $(".filter").html(filter)

  })
})

// fake data
function loadCategory(id) {

  $.get("http://localhost/techwiz3/techwiz/src/main/webapp/resources/localResources.js", function(data){
    product = "";
    data = JSON.parse(data);
    if ( id != 0 ) {
      data.forEach((item) => {

        if( id == item.categoryId.id ){
          product += `
                  <a href="product-details.html?id=${item.id}">
                      <div class="item">
                        <img src="images/products/${item.imgName}" alt="">
                        <p class="product-name">${item.title}</p>
                        <p class="product-price">${item.price} $</p>
                      </div>
                   </a>`;
        }

      });
    }else{
      data.forEach((item) => {
        product += `
                <a href="product-details.html?id=${item.id}">
                    <div class="item">
                      <img src="images/products/${item.imgName}" alt="">
                      <p class="product-name">${item.title}</p>
                      <p class="product-price">${item.price} $</p>
                    </div>
                 </a>`;
      });
    }

    $(".products").html(product);

  })

}



// render all
function loadDefault(){
    $.get("http://localhost/techwiz3/techwiz/src/main/webapp/resources/localResources.js", function(data){
      product = "";
      data = JSON.parse(data);

      data.forEach((item) => {
        product += `
                <a href="product-details.html?id=${item.id}">
                    <div class="item">
                      <img src="images/products/${item.imgName}" alt="">
                      <p class="product-name">${item.title}</p>
                      <p class="product-price">${item.price} $</p>
                    </div>
                 </a>`;
      });
      $(".products").html(product);


    })

}
loadDefault();
