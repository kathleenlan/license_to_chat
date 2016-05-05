class AddServiceClassBasenameToJurisdictions < ActiveRecord::Migration
  def change
    add_column :jurisdictions, :service_class_basename, :string, default: 'Standard'
  end
end
