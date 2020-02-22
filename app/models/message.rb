class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates :body, presence: true
  validates :body, length: { maximum:200 }

  validates_presence_of :body, :conversation_id, :user_id
  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

  # @message.change_read
  # def change_read
  #   self.object.read = true if (self.)read?
  # end
end