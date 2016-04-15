# encoding: utf-8
# frozen_string_literal: true
class LicensePlate < ActiveRecord::Base
  validates :identifier, presence: true
  validates :jurisdiction, presence: true

  belongs_to :jurisdiction, inverse_of: :license_plates

  has_many :comments, inverse_of: :license_plate
end