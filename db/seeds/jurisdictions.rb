module Seeds
  module Jurisdictions
    def self.sprout!
      puts 'Seeding Jurisdictions...'
      jurisdictions = YAML.load_file(jurisdictions_config_filepath)
      jurisdictions.each do |jurisdiction_attributes|
        Jurisdiction.find_or_create_by!(jurisdiction_attributes)
      end
      puts 'Done seeding Jurisdictions!'
    end

    def self.jurisdictions_config_filepath
      Rails.root.join('db', 'seeds', 'jurisdictions.yml').to_s
    end
    private_class_method :jurisdictions_config_filepath
  end
end
