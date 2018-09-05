class CreateUserMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :user_medications do |t|
      t.integer :user_id
      t.integer :medication_id
      t.string :name
      t.decimal :dose
      t.string :route
      t.string :frequency

      t.timestamps
    end
  end
end
