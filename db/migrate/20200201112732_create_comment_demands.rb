class CreateCommentDemands < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_demands do |t|
      t.references :demand, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
