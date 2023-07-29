import { Controller } from "@hotwired/stimulus"
import Timer from "easytimer.js";

export default class extends Controller {
    static targets = ['timer']

    connect() {
        const timer = new Timer();
        timer.start({
            precision: 'seconds',
            startValues: { seconds: 0 },
            callback: (e) => {
                this.timerTarget.innerText = timer.getTimeValues().toString();
            }
        });
    }
}
