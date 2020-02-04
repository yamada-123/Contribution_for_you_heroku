class CommentDemand < ApplicationRecord
  belongs_to :demand
  belongs_to :user
  validates :content,presence: true
end
