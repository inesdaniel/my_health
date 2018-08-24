class RemoveColumnFromUserVital < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_vitals, :date_completed, :datetime
  end
end
