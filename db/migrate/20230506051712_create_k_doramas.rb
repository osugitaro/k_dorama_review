class CreateKDoramas < ActiveRecord::Migration[6.1]
  def change
    create_table :k_doramas do |t|
      t.string :twitter_id
      t.string :title
      t.text :introduction

      t.timestamps
    end
  end
end
