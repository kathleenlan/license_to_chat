# encoding: utf-8
# frozen_string_literal: true
# NOTE: These specs use shoulda-matcher's ActionController matchers.
require 'rails_helper'

describe LicensePlatesController do
  describe '#index' do
    before do
      get(:index)
    end

    it 'renders the index template' do
      is_expected.to render_template('index')
    end
  end

  describe '#new' do
    before do
      get(:new)
    end

    it 'renders the new template' do
      is_expected.to render_template('new')
    end
  end

  describe '#create' do
    let(:license_plate_params) do
      HashWithIndifferentAccess.new(
        jurisdiction_id: 1,
        identifier: 'ABC-1234',
        fake_attribute: 'fake attribute!'
      )
    end
    let(:new_license_plate) do
      instance_double(
        'LicensePlate',
        formatted_errors: 'Something went wrong!'
      )
    end

    before do
      allow(LicensePlate).to receive(:new).and_return new_license_plate
    end

    context 'when the license plate is saved successfully' do
      before do
        allow(new_license_plate).to receive(:save).and_return true
        # the #post call needs to come after all stubbing
        post :create, license_plate: license_plate_params
      end

      it 'permits the appropriate attributes' do
        params = HashWithIndifferentAccess.new(
          license_plate: license_plate_params
        )
        is_expected.to permit(:jurisdiction_id, :identifier)
          .for(:create, params: params)
          .on(:license_plate)
      end
      it 'redirects to the show page' do
        is_expected.to redirect_to(license_plate_path(new_license_plate))
      end
      it 'sets a flash success message' do
        is_expected.to set_flash[:info]
      end
    end

    context 'when the license plate is not saved successfully' do
      before do
        allow(new_license_plate).to receive(:save).and_return false
        # the #post call needs to come after all stubbing
        post :create, license_plate: license_plate_params
      end

      it 'permits the appropriate attributes' do
        params = HashWithIndifferentAccess.new(
          license_plate: license_plate_params
        )
        is_expected.to permit(:jurisdiction_id, :identifier)
          .for(:create, params: params)
          .on(:license_plate)
      end
      it 'renders the new template' do
        is_expected.to render_template('new')
      end
      it 'sets a flash error message' do
        is_expected.to set_flash.now[:error]
      end
    end
  end

  describe '#show' do
    let(:license_plate_id) do
      123
    end

    before do
      allow(LicensePlate).to receive(:find_by).and_return license_plate
      # the #get call needs to come after all stubbing
      get :show, id: license_plate_id
    end

    context 'when the license plate is found' do
      let(:license_plate) do
        instance_double 'LicensePlate'
      end

      it 'renders the show template' do
        is_expected.to render_template('show')
      end
    end

    context 'when the license plate is not found' do
      let(:license_plate) do
        nil
      end

      it 'redirects to the root path' do
        is_expected.to redirect_to(root_path)
      end

      it 'sets a flash message' do
        is_expected.to set_flash[:error]
      end
    end
  end
end
