import { Controller } from "stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = [ "email" ]

  add(event) {
    event.preventDefault();
    let email = this.emailTarget.value.trim();
    let data = new FormData();
    data.append("subscribe[email]", email);

    Rails.ajax({
      url: 'api/v1/subscribe',
      type: 'POST',
      dataType: 'json',
      data,
      success: (resp) => {
        switch (resp.status) {
          case 'ok':
            alert('Subscribe successfully!');
            this.emailTarget.value = '';
            break;

          case 'duplicated':
            alert(`${email} was subscribed before!`);
            break;
        }
      },
      error: function(err) {
        console.log(err);
      }
    })
  }
}
