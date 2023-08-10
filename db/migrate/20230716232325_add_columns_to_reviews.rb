class AddColumnsToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :recommendation, :text
    add_column :reviews, :not_recommendation, :text
    add_column :reviews, :viewing_status, :string
  end
end
