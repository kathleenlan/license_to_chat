# encoding: utf-8
# frozen_string_literal: true
class LicensePlatePresenter < SimpleDelegator
  include ActionView::Helpers::FormOptionsHelper

  alias license_plate __getobj__

  def to_s
    "#{license_plate.identifier} - #{license_plate.jurisdiction}"
  end

  def jurisdiction_options_for_select
    options_for_select(jurisdiction_options, license_plate.jurisdiction_id)
  end

  def jurisdiction_options
    Jurisdiction.pluck :name, :id
  end

  def comments
    license_plate.comments.reverse_chronological_order.map do |comment|
      CommentPresenter.new(comment)
    end
  end

  def new_comment
    CommentPresenter.new(license_plate.comments.build)
  end

  def comments_count
    license_plate.comments_count
  end

  def most_recent_comment_preview
    most_recent_comment.message_preview
  end

  def most_recent_comment_timestamp
    most_recent_comment.created_at
  end

  private def most_recent_comment
    @most_recent_comment ||= extract_most_recent_comment
  end

  private def extract_most_recent_comment
    if license_plate.most_recent_comment
      CommentPresenter.new(
        license_plate.most_recent_comment
      )
    else
      NullCommentPresenter.new
    end
  end
end
