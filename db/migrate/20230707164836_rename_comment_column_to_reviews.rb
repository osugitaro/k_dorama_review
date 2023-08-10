class RenameCommentColumnToReviews < ActiveRecord::Migration[6.1]
  def change
    rename_column :reviews, :comment, :impression
  end
end
