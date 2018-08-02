class AddUserIdColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :exams, :user_id, :integer
    add_column :lab_tests, :user_id, :integer
    add_column :shots, :user_id, :integer
    add_column :vitals, :user_id, :integer
  end
end
