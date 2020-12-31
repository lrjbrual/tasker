class ListReflex < StimulusReflex::Reflex

  def create_task
    # binding.irb
    # raise "A terrible mistake"
    # sleep 2 
    list = List.find(element.dataset.list_id)
    # .merge is to merge the user and add the creator and connect using action cable
    @new_task = list.tasks.create(task_params.merge(creator: connection.current_user))
    @new_task = Task.new if @new_task.persisted?
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end

end