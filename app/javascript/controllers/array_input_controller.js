import { Controller } from "@hotwired/stimulus"
import TomSelect from 'tom-select/dist/js/tom-select.complete.min'

// Connects to data-controller="array-input"
export default class extends Controller {
  connect() {
    new TomSelect("#problem-choices",{
      persist: false,
      createOnBlur: true,
      create: true,
      maxItems: 4,
      delimiter: ';'
    });
  }
}
