# encoding: utf-8
# frozen_string_literal: true
require 'rails_helper'

describe LicensePlate do
  describe 'db columns and indices' do
    it do
      is_expected.to have_db_column(:identifier).of_type(:string)
        .with_options(null: false)
    end
    it do
      is_expected.to have_db_column(:jurisdiction_id).of_type(:integer)
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

    it do
      is_expected.to have_db_column(:jurisdiction_id)
    end
  end

  describe 'associations' do
    it do
      is_expected.to belong_to(:jurisdiction).inverse_of(:license_plates)
    end
    it do
      is_expected.to have_many(:comments).inverse_of(:license_plate)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:identifier) }
    it { is_expected.to validate_presence_of(:jurisdiction) }
  end

  describe '#identifier_and_jurisdiction' do
    let(:identifier) do
      'ABC-1234'
    end
    let(:jurisdiction) do
      instance_double(
        'Jurisdiction',
        to_s: jurisdiction_name
      )
    end
    let(:jurisdiction_name) do
      'North Carolina, U.S.A.'
    end

    subject do
      described_class.new(identifier: identifier)
    end

    before do
      allow(subject).to receive(:jurisdiction).and_return jurisdiction
    end

    it 'returns a string concatenation of the identifier and jurisdiction' do
      expected_string = "#{identifier} - #{jurisdiction_name}"
      expect(subject.identifier_and_jurisdiction).to eql expected_string
    end
  end
end
