class TaskReflex < StimulusReflex::Reflex

  # def complete
  #   Task.find(element.dataset.id).update(completed_at: Time.current)
  # end
  
  # def undo
  #   Task.find(element.dataset.id).update(completed_at: nil)
  # end

  #using this I less the code adding method of complete and undo
  def toggle
    # binding.pry
    Task.find(element.dataset.id).update(completed_at: element.checked ? Time.current : nil)
  end

  def destroy
    Task.find(element.dataset.id).destroy
  end

end