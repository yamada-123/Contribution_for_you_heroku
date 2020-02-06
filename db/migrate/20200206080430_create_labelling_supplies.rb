class CreateLabellingSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :labelling_supplies do |t|
      t.references :label, foreign_key: true
      t.references :supply, foreign_key: true

      t.timestamps
    end
  end
end
