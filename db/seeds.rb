module Seeds
  def self.sprout!
    Dir[path_to_seeds_files].each { |file| require file }
    Seeds::Jurisdictions.sprout!
  end

  def self.path_to_seeds_files
    Rails.root.join('db', 'seeds', '**', '*.rb')
  end
  private_class_method :path_to_seeds_files
end

Seeds.sprout!
