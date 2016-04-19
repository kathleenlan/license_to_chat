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

  describe '#message_preview' do
    context 'when the comment does not have a message' do
      before do
        allow(comment).to receive(:message).and_return nil
      end

      it 'returns an empty string' do
        expect(subject.message_preview).to eql ''
      end
    end

    context 'when the comment does have a message' do
      let(:comment_message) do
        # rubocop:disable Metrics/LineLength
        'We hold these truths to be self-evident, that all men are created equal, that they are endowed by their Creator with certain unalienable Rights, that among these are Life, Liberty and the pursuit of Happiness.'
        # rubocop:enable Metrics/LineLength
      end

      before do
        allow(comment).to receive(:message).and_return comment_message
      end

      it 'returns the first ~80 characters of the message' do
        # rubocop:disable Metrics/LineLength
        expected_string = 'We hold these truths to be self-evident, that all men are created equal, that...'
        # rubocop:enable Metrics/LineLength
        expect(subject.message_preview).to eql expected_string
      end
    end
  end

  describe '#created_at' do
    it 'returns the created_at datetime in the correct format' do
      pattern = /\A[A-Z][a-z]+ \d{1,2}, \d{4} at \d{1,2}:\d{2}(am|pm)\z/
      expect(subject.created_at).to match(pattern)
    end
  end
end
