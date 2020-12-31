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
    if element.checked
      @task.update(completed_at: Time.current, completer: connection.current_user)
      # @task.update(completed_at: element.checked ? Time.current : nil)
    else
      @task.update(completed_at: nil, completer: nil)
    end
   end

  def destroy
    @task.destroy
  end

  def reorder(position)
    @task.insert_at(position)
  end

  def assign
    @task.update(assignee_id: element.value)
    # this will auto update the page when selecting the user then show the label that connect to the model
    # that connect to the model delegation
    morph "#task-#{@task.id}-assignee", @task.assignee_name
    # morph :nothing
  end
  
  private

  def find_task
    @task = Task.find(element.dataset.id)
  end

end