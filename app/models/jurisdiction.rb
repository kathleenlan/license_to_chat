class Jurisdiction < ActiveRecord::Base
  has_many :license_plates
end
