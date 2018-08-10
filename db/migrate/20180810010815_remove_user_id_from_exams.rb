class RemoveUserIdFromExams < ActiveRecord::Migration[5.2]
  def change
    remove_column :exams, :user_id, :integer
    remove_column :exams, :date_completed, :text
  end
end
