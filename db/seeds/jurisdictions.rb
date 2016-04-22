module Seeds
  module Jurisdictions
    def self.sprout!
      puts 'Seeding Jurisdictions...'
      jurisdiction_names = YAML.load_file(jurisdictions_config_filepath)
      jurisdiction_names.each do |j_name|
        Jurisdiction.find_or_create_by!(name: j_name)
      end
      puts 'Done seeding Jurisdictions!'
    end

    def self.jurisdictions_config_filepath
      Rails.root.join('db', 'seeds', 'jurisdictions.yml').to_s
    end
    private_class_method :jurisdictions_config_filepath
  end
end
