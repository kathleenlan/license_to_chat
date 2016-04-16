# encoding: utf-8
# frozen_string_literal: true
class LicensePlatePresenter < SimpleDelegator
  alias license_plate __getobj__

  def to_s
    "#{license_plate.identifier} - #{license_plate.jurisdiction}"
  end

  def comments
    license_plate.comments.reverse_chronological_order.map do |comment|
      CommentPresenter.new(comment)
    end
  end
end
