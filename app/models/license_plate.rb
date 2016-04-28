# encoding: utf-8
# frozen_string_literal: true
class LicensePlate < ActiveRecord::Base
  include HasErrors

  validates :identifier, presence: true,
                         uniqueness: { scope: [:jurisdiction_id] }
  validates :jurisdiction, presence: true

  belongs_to :jurisdiction, inverse_of: :license_plates

  has_many :comments, inverse_of: :license_plate

  scope :ordered, -> { order(created_at: :desc) }

  def comments_count
    comments.count
  end

  def most_recent_comment
    comments.reverse_chronological_order.first
  end
end
