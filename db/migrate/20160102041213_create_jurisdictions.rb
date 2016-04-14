class CreateJurisdictions < ActiveRecord::Migration
  def change
    create_table :jurisdictions do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
