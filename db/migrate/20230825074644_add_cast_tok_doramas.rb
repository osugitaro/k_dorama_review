class AddCastTokDoramas < ActiveRecord::Migration[6.1]
  def change
    add_column :k_doramas, :cast, :string
  end
end
