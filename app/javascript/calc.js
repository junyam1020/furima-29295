window.addEventListener('focusout', () => {
  // item-priceの値を取得
  const price = document.getElementById("item-price").value;
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  add_tax_price.innerHTML = price * 0.1
  profit.innerHTML = price * 0.9
});


