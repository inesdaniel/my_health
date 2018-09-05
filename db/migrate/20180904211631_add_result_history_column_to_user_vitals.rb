class AddResultHistoryColumnToUserVitals < ActiveRecord::Migration[5.2]
  def change
    add_column :user_vitals, :result_history, :string
  end
end
