class AddArrayInputToResultHistoryColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_vitals, :result_history, :string
  end
end
