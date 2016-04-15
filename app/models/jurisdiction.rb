# encoding: utf-8
# frozen_string_literal: true
class Jurisdiction < ActiveRecord::Base
  validates :name, presence: true

  has_many :license_plates, inverse_of: :jurisdiction

  def to_s
    name.to_s
  end
end
