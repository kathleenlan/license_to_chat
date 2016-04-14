require 'rails_helper'

describe Comment do
  describe 'db columns and indices' do
    it do
      is_expected.to have_db_column(:message).of_type(:text)
        .with_options(null: false)
    end
    it do
      is_expected.to have_db_column(:license_plate_id).of_type(:integer)
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
      is_expected.to belong_to(:license_plate).inverse_of(:comments)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:message) }
    it { is_expected.to validate_presence_of(:license_plate) }
  end
end
