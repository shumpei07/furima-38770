window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
    // innerHTML：HTML要素の中身を変更するときに使われるプロパティ
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))

  })

});