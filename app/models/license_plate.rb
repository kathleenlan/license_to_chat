class LicensePlate < ActiveRecord::Base
  belongs_to :jurisdiction

  has_many :comments
end
