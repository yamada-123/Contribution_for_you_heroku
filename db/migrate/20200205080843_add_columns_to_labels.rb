class AddColumnsToLabels < ActiveRecord::Migration[5.2]
  def change
    add_column :labels, :category, :string
  end
end
