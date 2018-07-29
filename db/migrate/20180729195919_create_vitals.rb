class CreateVitals < ActiveRecord::Migration[5.2]
  def change
    create_table :vitals do |t|
      t.string :name
      t.integer :reading

      t.timestamps
    end
  end
end
