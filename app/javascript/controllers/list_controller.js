import { Controller } from "stimulus";
import StimulusReflex from "stimulus_reflex";

export default class extends Controller {
  static targets = ["form"];
  connect() {
    StimulusReflex.register(this);
  }

  //create only one task if something happen in the server
  beforeCreateTask(element){
    element.querySelectorAll("input").forEach(input => input.blur());
    element.classList.add("form-disabled");
  }

  // beforeCreateTask(){
  createTaskSuccess() {
    this.formTarget.reset();
    // console.log("");
  }

  createTaskError(element, name, error) {
    alert(error);
  }
}