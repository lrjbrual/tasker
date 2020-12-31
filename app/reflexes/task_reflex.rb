class TaskReflex < StimulusReflex::Reflex
  #server side call backs
  before_reflex :find_task

  # def complete
  #   Task.find(element.dataset.id).update(completed_at: Time.current)
  # end
  
  # def undo
  #   Task.find(element.dataset.id).update(completed_at: nil)
  # end

  #using this I less the code adding method of complete and undo
  def toggle
    # binding.pry
    @task.update(completed_at: element.checked ? Time.current : nil)
  end

  def destroy
    @task.destroy
  end

  def reorder(position)
    @task.insert_at(position)
  end
  
  private

  def find_task
    @task = Task.find(element.dataset.id)
  end

end