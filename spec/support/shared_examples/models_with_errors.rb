# encoding: utf-8
# frozen_string_literal: true
RSpec.shared_examples 'a model that captures errors' do
  let(:errors) do
    instance_double(
      'ActiveModel::Errors',
      full_messages: full_messages
    )
  end
  let(:full_messages) do
    instance_double(
      'Array',
      to_sentence: errors_in_sentence
    )
  end
  let(:errors_in_sentence) do
    'Here are all of your errors. Thing 1 went wrong. Thing 2 went wrong.'
  end

  before do
    allow(subject).to receive(:errors).and_return errors
  end

  describe '#formatted_errors' do
    it 'returns the errors formatted in a sentence' do
      expect(subject.formatted_errors).to eql errors_in_sentence
    end
  end
end
