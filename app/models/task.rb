class Task < ApplicationRecord
  belongs_to :list

  # adding to the index for order
  scope :incomplete_first, -> { order(completed_at: :desc) }

  # call if completed
  def complete?
    completed_at.present?
  end
end
