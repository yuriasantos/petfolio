import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="records"
export default class extends Controller {
  static targets = [ 'form', 'appointment' ]

  connect() {

  }

  send(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)

        if (data.record) {
          this.appointmentTarget.insertAdjacentHTML("beforeend", data.record)
          this.formTarget.remove()
        } else {
          this.formTarget.outerHTML = data.form
        }
      })
  }
}
