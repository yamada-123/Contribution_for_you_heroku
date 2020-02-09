class CreateFavoriteSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_supplies do |t|
      t.integer :user_id
      t.integer :supply_id
      #t.references :user, foreign_key:true
      #t.references :supply, foreign_key:true
      t.timestamps
    end
  end
end
