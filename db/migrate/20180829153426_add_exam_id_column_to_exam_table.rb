class AddExamIdColumnToExamTable < ActiveRecord::Migration[5.2]
  def change
    add_column :exams, :exam_id, :integer
  end
end
