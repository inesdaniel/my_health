class ChangeNormalRangeColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :lab_tests, :normal_low_end, :text
    rename_column :lab_tests, :normal_range, :normal_high_end
  end
end
