class AddPictureToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :picture, :string
  end
end
