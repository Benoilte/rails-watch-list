import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    console.log("hello world");
    new Typed(this.element, {
      strings: ['Grab your popcorn ^1500 Hurry up!'],
      showCursor: false,
      typeSpeed: 10,
      loop: false
    })
  }
}
