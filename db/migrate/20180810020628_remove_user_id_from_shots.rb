class RemoveUserIdFromShots < ActiveRecord::Migration[5.2]
  def change
    remove_column :shots, :user_id, :integer
    remove_column :shots, :date_completed, :text
  end
end
