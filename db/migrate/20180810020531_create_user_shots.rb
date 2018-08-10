class CreateUserShots < ActiveRecord::Migration[5.2]
  def change
    create_table :user_shots do |t|
      t.integer :user_id
      t.integer :shot_id
      t.datetime :date_completed

      t.timestamps
    end
  end
end
