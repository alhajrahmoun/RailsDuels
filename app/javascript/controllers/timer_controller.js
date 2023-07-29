import { Controller } from "@hotwired/stimulus"
import Timer from "easytimer.js";

export default class extends Controller {
  static targets = [ 'timer' ]
  static values = { url: String }

  connect() {
    const timer = new Timer();
    timer.start({
      countdown: true,
      precision: 'seconds',
      startValues: { seconds: 10 },
      callback: (e) => {
        this.timerTarget.innerText = timer.getTimeValues().toString();
      }
    });

    timer.addEventListener("targetAchieved", (e) =>{
      Turbo.visit(this.urlValue);
    });
  }
}
