import { Controller } from "stimulus";
import StimulusReflex from "stimulus_reflex";
import Sortable from "sortablejs";

export default class extends Controller {
  static targets = ["form", "tasks"];
  connect() {
    StimulusReflex.register(this);

    Sortable.create(this.tasksTarget, {
      filter: '.completed',
      //onEnd is call back
      onEnd: (event) => this.reorder(event),
    });
  }

  reorder(event){
    this.stimulate("TaskReflex#reorder", event.item, event.newIndex)
  }

  //create only one task if something happen in the server
  beforeCreateTask(element){
    element.querySelectorAll("input").forEach(input => input.blur());
    element.classList.add("form-disabled");
  }

  // beforeCreateTask(){
  createTaskSuccess() {
    this.formTarget.reset();
    console.log("fire me?");
  }

  createTaskError(element, name, error) {
    alert(error);
  }
}