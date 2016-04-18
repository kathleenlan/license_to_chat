# encoding: utf-8
# frozen_string_literal: true
require 'rails_helper'
require 'support/shared_examples/models_with_errors'

describe LicensePlate do
  it_behaves_like 'a model that captures errors'

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

  describe '#comments_count' do
    let(:comments) do
      instance_double(
        'ActiveRecord::Associations::CollectionProxy',
        count: comments_count
      )
    end
    let(:comments_count) do
      93_412
    end

    before do
      allow(subject).to receive(:comments).and_return comments
    end

    it 'returns the number of comments the subject has' do
      expect(subject.comments_count).to eql comments_count
    end
  end
end
