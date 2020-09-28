import { Controller } from "stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = [ "quantity", "sku", "addToCartButton" ]

  add_to_cart(evt) {
    evt.preventDefault();

    let product_id = this.data.get('id');
    let sku = this.skuTarget.value;
    let quantity = this.quantityTarget.value;

    if (quantity > 0) {
      this.addToCartButtonTarget.classList.add("spinner-grow", "text-white");
      this.addToCartButtonTarget.innerHTML = '';

      let data = new FormData();
      data.append("id", product_id);
      data.append("sku", sku);
      data.append("quantity", quantity);
  
      Rails.ajax({
        url: '/api/v1/cart',
        type: 'POST',
        data,
        success: resp => {
          console.log(resp);
        },
        error: err => {
          console.log(err);
        }
      })
    }
  }

  quantity_minus(evt) {
    evt.preventDefault();
    let q = Number(this.quantityTarget.value);
    if ( q > 1 ) {
      this.quantityTarget.value = q - 1;
    }
  }

  quantity_plus(evt) {
    evt.preventDefault();
    let q = Number(this.quantityTarget.value);
    this.quantityTarget.value = q + 1;
  }
}