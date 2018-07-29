class CreateLabTests < ActiveRecord::Migration[5.2]
  def change
    create_table :lab_tests do |t|
      t.string :name
      t.integer :result

      t.timestamps
    end
  end
end
