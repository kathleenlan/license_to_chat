class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message, null: false
      t.references :license_plate, index: true, null: false

      t.timestamps null: false
    end
  end
end
