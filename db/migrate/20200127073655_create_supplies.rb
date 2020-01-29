class CreateSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :supplies do |t|
      t.string :title
      t.text :content
      t.string :picture
    end
  end
end
