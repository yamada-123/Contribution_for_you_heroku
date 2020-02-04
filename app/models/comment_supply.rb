class CommentSupply < ApplicationRecord
  belongs_to :supply
  belongs_to :user
  validates :content,presence: true
end
