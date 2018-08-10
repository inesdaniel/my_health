class RemoveUserIdFromVitals < ActiveRecord::Migration[5.2]
  def change
    remove_column :vitals, :user_id, :integer
    remove_column :vitals, :date_completed, :text
    remove_column :vitals, :reading, :integer
  end
end
