# encoding: utf-8
# frozen_string_literal: true
require 'rails_helper'

describe CommentPresenter do
  let(:comment) do
    instance_double(
      'Comment',
      created_at: Time.zone.now
    )
  end

  subject do
    described_class.new(comment)
  end

  describe '#created_at' do
    it 'returns the created_at datetime in the correct format' do
      pattern = /\A[A-Z][a-z]+ \d{1,2}, \d{4} at \d{1,2}:\d{2}(am|pm)\z/
      expect(subject.created_at).to match(pattern)
    end
  end
end
