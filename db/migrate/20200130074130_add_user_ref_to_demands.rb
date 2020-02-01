class AddUserRefToDemands < ActiveRecord::Migration[5.2]
  def change
    add_reference :demands, :user, foreign_key: true
  end
end
