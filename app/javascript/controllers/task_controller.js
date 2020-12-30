import { Controller } from "stimulus";
import StimulusReflex from "stimulus_reflex";

export default class extends Controller {
  connect() {
    StimulusReflex.register(this);
  }
  
  destroy() {
    const confirmation = confirm("Are you sure?");

    if (confirmation) {
      // use stimulate anytime you want to trigger the reflex inside your javascript
      this.stimulate('TaskReflex#destroy', event.currentTarget)
    }
    // console.log(confirmation);
  }

  beforeCreate() {
    console.log("hello from me");
  }

}