class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :device_name
      t.text :description

      t.timestamps
    end
  end
end
