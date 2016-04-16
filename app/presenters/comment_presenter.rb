# encoding: utf-8
# frozen_string_literal: true
class CommentPresenter < SimpleDelegator
  alias comment __getobj__

  # TODO: Add internationalization for date format.
  def created_at
    comment.created_at.strftime(us_datetime_format)
  end

  private def us_datetime_format
    '%B %d, %Y at %-l:%M%P'
  end
end
