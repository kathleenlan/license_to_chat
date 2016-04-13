class CreatePlates < ActiveRecord::Migration
  def change
    create_table :plates do |t|
      t.string :identifier
      t.references :jurisdiction, index: true
    end
  end
end
