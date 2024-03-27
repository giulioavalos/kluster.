import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("Hello from review_form_controller.js")
    this.formTarget.style.display = "none"

  }

  displayForm() {
    console.log("Displaying form")
    console.log(this.formTarget)
    console.log(this.formTarget.style.display)
    this.formTarget.style.display = "block"
    console.log(this.formTarget.style.display)

  }
}
