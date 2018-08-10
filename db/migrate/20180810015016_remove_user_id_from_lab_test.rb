class RemoveUserIdFromLabTest < ActiveRecord::Migration[5.2]
  def change
    remove_column :lab_tests, :user_id, :integer
    remove_column :lab_tests, :date_completed, :text
    change_column :lab_tests, :normal_high_end, "numeric USING CAST(normal_high_end AS numeric)"
    change_column :lab_tests, :normal_high_end, :decimal, precision: 7, scale: 2
    change_column :lab_tests, :normal_low_end, "numeric USING CAST(normal_low_end AS numeric)"
    change_column :lab_tests, :normal_low_end, :decimal, precision: 7, scale: 2
  end
end
