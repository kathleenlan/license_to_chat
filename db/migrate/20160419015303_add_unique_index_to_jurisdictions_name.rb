class AddUniqueIndexToJurisdictionsName < ActiveRecord::Migration
  def change
    add_index :jurisdictions, :name, unique: true
  end
end
