class AddRateAverageToKdoramas < ActiveRecord::Migration[6.1]
  def change
    add_column :k_doramas, :rate_average, :float, default: 0.0
  end
end
