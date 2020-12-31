class Task < ApplicationRecord
  acts_as_list scope: [:list_id, completed_at: nil], top_of_list: 0
  belongs_to :list
  validates :name, presence: true

  # adding to the index for order
  scope :incomplete_first, -> { order(completed_at: :desc) }

  # call if completed
  def complete?
    completed_at.present?
  end
end
