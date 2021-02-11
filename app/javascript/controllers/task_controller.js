import { Controller } from "stimulus";
import StimulusReflex from "stimulus_reflex";

export default class extends Controller {
  static classes = ["incomplete"]
  static targets = ["checkbox", "collapse"];

  connect() {
    StimulusReflex.register(this);

    //hide checkbox when collapse using jquery from bootstrap
    $(this.collapseTarget).on('show.bs.collapse', () => {
      this.checkboxTarget.classList.add("d-none");
      //this will not drag and drop the edit mode
      this.element.classList.remove(this.incompleteClass);
    });

    // to toggle back
    $(this.collapseTarget).on("hide.bs.collapse", () => {
      this.checkboxTarget.classList.remove("d-none");
      this.element.classList.add(this.incompleteClass);
    });
  }
  
  destroy() {
    event.preventDefault();
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