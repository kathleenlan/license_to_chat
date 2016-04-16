# encoding: utf-8
# frozen_string_literal: true
module HasErrors
  # Note: #errors should return an ActiveModel::Errors
  def formatted_errors
    errors.full_messages.to_sentence
  end
end
