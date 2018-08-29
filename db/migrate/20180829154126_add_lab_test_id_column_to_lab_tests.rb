class AddLabTestIdColumnToLabTests < ActiveRecord::Migration[5.2]
  def change
    add_column :lab_tests, :lab_test_id, :integer
    add_column :shots, :shot_id, :integer
    add_column :vitals, :vital_id, :integer
  end
end
