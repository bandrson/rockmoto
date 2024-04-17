import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["item"]

    toggle() {
        for (const tgt of this.itemTargets) {
            tgt.classList.toggle("hidden");
        }
    }
}
