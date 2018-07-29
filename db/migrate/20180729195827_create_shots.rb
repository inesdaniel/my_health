class CreateShots < ActiveRecord::Migration[5.2]
  def change
    create_table :shots do |t|
      t.string :name
      t.integer :date_given

      t.timestamps
    end
  end
end
