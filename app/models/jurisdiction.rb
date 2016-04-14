class Jurisdiction < ActiveRecord::Base
  validates :name, presence: true

  has_many :license_plates, inverse_of: :jurisdiction
end
