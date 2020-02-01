class CreateFavoriteDemands < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_demands do |t|
      t.integer :user_id
      t.integer :demand_id

      t.timestamps
    end
  end
end
