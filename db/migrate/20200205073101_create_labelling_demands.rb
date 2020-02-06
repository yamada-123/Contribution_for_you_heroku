class CreateLabellingDemands < ActiveRecord::Migration[5.2]
  def change
    create_table :labelling_demands do |t|
      t.references :demand, foreign_key: true
      t.references :label, foreign_key: true

      t.timestamps
    end
  end
end
