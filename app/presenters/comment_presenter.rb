# encoding: utf-8
# frozen_string_literal: true
class CommentPresenter < SimpleDelegator
  include ActionView::Helpers::FormOptionsHelper

  alias comment __getobj__

  def message_preview
    truncate(message, length: 80, separator: ' ').to_s
  end

  # TODO: Add internationalization for date format.
  def created_at
    comment.created_at.strftime(us_datetime_format)
  end

  private def us_datetime_format
    '%B %d, %Y at %-l:%M%P'
  end

  private def message
    comment.message
  end
end
