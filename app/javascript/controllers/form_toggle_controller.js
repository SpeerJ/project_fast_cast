import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-toggle"
export default class extends Controller {

  toggle({params: {id}}) {
    console.log("hellos: " + id)
    document.getElementById(id).classList.toggle("invisible")
    document.getElementById(id).classList.toggle("hidden")
  }
}
