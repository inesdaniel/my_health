class AddColumnToUserVitals < ActiveRecord::Migration[5.2]
  def change
    add_column :user_vitals, :date_completed, :datetime
  end
end
