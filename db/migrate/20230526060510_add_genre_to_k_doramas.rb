class AddGenreToKDoramas < ActiveRecord::Migration[6.1]
  def change
    add_column :k_doramas, :genre, :string
  end
end
