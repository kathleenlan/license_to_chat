class CreateLicensePlates < ActiveRecord::Migration
  def change
    create_table :license_plates do |t|
      t.string :identifier
      t.references :jurisdiction, index: true
    end
  end
end
