class CreateUserVitals < ActiveRecord::Migration[5.2]
  def change
    create_table :user_vitals do |t|
      t.integer :user_id
      t.integer :vital_id
      t.datetime :date_completed
      t.string :result

      t.timestamps
    end
  end
end
