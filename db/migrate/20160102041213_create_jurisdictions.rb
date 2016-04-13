class CreateJurisdictions < ActiveRecord::Migration
  def change
    create_table :jurisdictions do |t|
      t.name
    end
  end
end
