class AddArrayInputToResultHistoryColumnVitals < ActiveRecord::Migration[5.2]
  def change
    add_column :user_vitals, :result_history, :text, array:true, default: []
  end
end
