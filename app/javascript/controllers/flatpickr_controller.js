import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ["arrivalTime", "endTime"]
  connect() {
    console.log("Stimulus connected")
    flatpickr(this.arrivalTimeTarget, {
      // enableTime: true,
      // Provide an id for the plugin to work
      plugins: [new rangePlugin({ input: "#end_time"})]
    })
    // console.log("flatpickr arrival target targeted")
    flatpickr(this.endTimeTarget, {})
    // console.log("flatpickr endTime target targeted")
  }
}
