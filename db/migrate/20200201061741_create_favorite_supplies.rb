class CreateFavoriteSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_supplies do |t|
      t.integer :user_id
      t.integer :supply_id

      t.timestamps
    end
  end
end
