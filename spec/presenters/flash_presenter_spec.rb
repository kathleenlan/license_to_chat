# encoding: utf-8
# frozen_string_literal: true
require 'rails_helper'

describe FlashPresenter do
  let(:message) do
    'Vroom vroom!'
  end

  subject do
    described_class.new(key: key, message: message)
  end

  describe '#css_classes' do
    context 'when the key is :info' do
      let(:key) do
        :info
      end

      it 'returns "blue"' do
        expect(subject.css_classes).to eql 'blue'
      end
    end
    context 'when the key is :error' do
      let(:key) do
        :error
      end

      it 'returns "negative"' do
        expect(subject.css_classes).to eql 'negative'
      end
    end
    context 'when the key is neither :info nor :error' do
      let(:key) do
        :something_else
      end

      it 'returns "yellow"' do
        expect(subject.css_classes).to eql 'yellow'
      end
    end
  end
end
