class AddNormalRangeToLabTests < ActiveRecord::Migration[5.2]
  def change
    add_column :lab_tests, :normal_range, :text
  end
end
