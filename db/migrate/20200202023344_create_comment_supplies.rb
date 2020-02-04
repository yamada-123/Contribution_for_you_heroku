class CreateCommentSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_supplies do |t|
      t.references :supply, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
