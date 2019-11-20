//show cart functions
function increaseQuantity(item){
    var quantity = document.getElementById(item).value;
    quantity++;
    document.getElementById(item).value = quantity;
    //updateCart();
}
function decreaseQuantity(item){
    var quantity = document.getElementById(item).value;
    if(quantity == 0)
        return;
    quantity--;
    document.getElementById(item).value = quantity;
    //updateCart();
}
function removeItem(item){
    document.getElementById(item).value = 0;
    //updateCart();
}
function updateCart(){
    document.forms[0].submit();
}