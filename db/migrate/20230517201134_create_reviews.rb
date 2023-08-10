class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :k_dorama, null: false, foreign_key: true
      t.string :user
      t.string :references
      t.text :comment

      t.timestamps
    end
  end
end
