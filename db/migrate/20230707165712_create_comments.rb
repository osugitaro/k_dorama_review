class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :user, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true
      t.references :parent, foreign_key: { to_table: :comments }

      t.timestamps
    end
  end
end
