import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["select"]
    static values = {
        url: String,
        urlParam: String,
        frameTag: String
    }

    connect() {
        this.selectTarget.dataset.action = "change->select-turbo#change";
    }

    change() {
        const value = this.selectTarget.value;
        const baseUrl = this.urlValue;
        const fullUrl = `${baseUrl}?${this.urlParamValue}=${value}`;
        const frameTag = this.frameTagValue;

        const frame = document.querySelector(`turbo-frame#${frameTag}`);
        frame.src = fullUrl;
        frame.reload();
    }
}
