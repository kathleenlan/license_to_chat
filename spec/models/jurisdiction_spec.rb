# encoding: utf-8
# frozen_string_literal: true
require 'rails_helper'

describe Jurisdiction do
  describe 'db columns and indices' do
    it do
      is_expected.to have_db_column(:name).of_type(:string)
        .with_options(null: false)
    end
    it do
      is_expected.to have_db_column(:created_at).of_type(:datetime)
        .with_options(null: false)
    end
    it do
      is_expected.to have_db_column(:updated_at).of_type(:datetime)
        .with_options(null: false)
    end
  end

  describe 'associations' do
    it do
      is_expected.to have_many(:license_plates).inverse_of(:jurisdiction)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '#to_s' do
    context 'when the name is nil' do
      subject { described_class.new(name: nil) }

      it 'returns an empty string' do
        expect(subject.to_s).to eql ''
      end
    end

    context 'when the name is not nil' do
      let(:name) do
        'North Carolina, U.S.A.'
      end

      subject { described_class.new(name: name) }

      it 'returns the name' do
        expect(subject.to_s).to eql name
      end
    end
  end
end
