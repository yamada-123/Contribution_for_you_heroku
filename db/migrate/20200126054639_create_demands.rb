class CreateDemands < ActiveRecord::Migration[5.2]
  def change
    create_table :demands do |t|
      t.string :title
      t.text :content
      t.string :picture
      t.string :region
      t.string :category
    end
  end
end
