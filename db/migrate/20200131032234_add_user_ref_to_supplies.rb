class AddUserRefToSupplies < ActiveRecord::Migration[5.2]
  def change
    add_reference :supplies, :user, foreign_key: true
  end
end
