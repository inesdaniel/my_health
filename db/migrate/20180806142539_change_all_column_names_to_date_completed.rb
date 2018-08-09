class ChangeAllColumnNamesToDateCompleted < ActiveRecord::Migration[5.2]
  def change
    rename_column :shots, :date_given, :date_completed
    add_column :lab_tests, :date_completed, :text
    add_column :vitals, :date_completed, :text
    change_column :exams, :date_completed, :text
  end
end
