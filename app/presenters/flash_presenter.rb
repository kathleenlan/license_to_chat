# encoding: utf-8
# frozen_string_literal: true
class FlashPresenter
  attr_reader :key, :message

  def initialize(key:, message:)
    @key = key
    @message = message
  end

  def css_classes
    case key.to_s
    when 'info'
      'blue'
    when 'error'
      'negative'
    else
      'yellow'
    end
  end
end
