class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :user_id
      t.string :test_name
      t.decimal :result
      t.datetime :date_completed

      t.timestamps
    end
  end
end
