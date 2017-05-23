class AddMoreDetailToRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :case_number, :integer
    add_column :records, :date, :date
    add_column :records, :hospital, :string
    add_column :records, :hospital_contact, :string
    add_column :records, :telephone, :integer
    add_column :records, :room_id, :string
    add_column :records, :device_model, :string
    add_column :records, :serial_number, :string
    add_column :records, :maintenance, :text
    add_column :records, :result, :string
    add_column :records, :remarks, :text
    add_column :records, :service_engineer, :string

  end
end
