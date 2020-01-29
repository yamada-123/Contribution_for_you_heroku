class RemoveColumnsFromDemands < ActiveRecord::Migration[5.2]
  def change
    remove_column :demands, :"region", :string
    remove_column :demands, :"category", :string
  end
end
