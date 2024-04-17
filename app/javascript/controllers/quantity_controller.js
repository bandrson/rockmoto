import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["counter"]

    decrement() {
        const currentVal = this.counterTarget.value;
        if (currentVal > this.counterTarget.getAttribute("min")) {
            this.counterTarget.value = Number(currentVal) - 1;
        }
    }

    increment() {
        const currentVal = this.counterTarget.value;
        if (currentVal < this.counterTarget.getAttribute("max")) {
            this.counterTarget.value = Number(currentVal) + 1;
        }
    }
}
