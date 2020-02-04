class AddUserRefToCommentDemands < ActiveRecord::Migration[5.2]
  def change
    add_reference :comment_demands,:user, foreign_key: true
  end
end
