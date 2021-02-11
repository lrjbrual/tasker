class Task < ApplicationRecord
  acts_as_list scope: [:list_id, completed_at: nil], top_of_list: 0
  belongs_to :assignee, class_name: "User", optional: true
  belongs_to :completer, class_name: "User", optional: true
  belongs_to :creator, class_name: "User"
  belongs_to :list
  has_many :comments, as: :commentable
  validates :name, presence: true

  # adding to the index for order
  scope :incomplete_first, -> { order(completed_at: :desc) }
  # adding delegation to prevent if nil
  delegate :name, to: :assignee, prefix: true, allow_nil: true
  delegate :name, to: :completer, prefix: true, allow_nil: true
  # task.assignee_name 

  # call if completed
  def complete?
    completed_at.present?
  end
end
