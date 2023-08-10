class AddUserIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :user_id, :string
  end
end
