import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("Hello from review_form_controller.js")
  }

  displayForm() {
    this.formTarget.style.display = "block"
  }
}
