class CreateUserLabTests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_lab_tests do |t|
      t.integer :user_id
      t.integer :lab_test_id
      t.datetime :date_completed
      t.decimal :result

      t.timestamps
    end
  end
end
