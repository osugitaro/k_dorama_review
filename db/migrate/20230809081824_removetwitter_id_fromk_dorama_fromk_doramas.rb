class RemovetwitterIdFromkDoramaFromkDoramas < ActiveRecord::Migration[6.1]
  def change
    remove_column :k_doramas, :twitter_id, :string
  end
end
