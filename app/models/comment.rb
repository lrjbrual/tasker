class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  #adding the name to the user and print the body
  delegate :name, to: :user, prefix: true
end
