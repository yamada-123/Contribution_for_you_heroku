class AddUserRefToCommentSupplies < ActiveRecord::Migration[5.2]
  def change
    add_reference :comment_supplies, :user, foreign_key: true
  end
end
