class CreateLicensePlates < ActiveRecord::Migration
  def change
    create_table :license_plates do |t|
      t.string :identifier, null: false
      t.references :jurisdiction, index: true, null: false

      t.timestamps null: false
    end
  end
end
