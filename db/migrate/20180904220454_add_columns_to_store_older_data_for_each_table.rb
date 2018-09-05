class AddColumnsToStoreOlderDataForEachTable < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :result_history, :text, array:true, default: []
    add_column :results, :date_history, :datetime, array:true, default: []

    add_column :user_exams, :date_history, :datetime, array:true, default: []

    add_column :user_lab_tests, :result_history, :text, array:true, default: []
    add_column :user_lab_tests, :date_history, :datetime, array:true, default: []

    add_column :user_shots, :date_history, :datetime, array:true, default: []

    add_column :user_vitals, :date_history, :datetime, array:true, default: []

  end
end
