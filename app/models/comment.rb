# encoding: utf-8
# frozen_string_literal: true
class Comment < ActiveRecord::Base
  include HasErrors

  validates :message, presence: true
  validates :license_plate, presence: true

  belongs_to :license_plate, inverse_of: :comments

  scope :reverse_chronological_order, -> { order(created_at: :desc) }
end
