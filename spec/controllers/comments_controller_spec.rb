# encoding: utf-8
# frozen_string_literal: true
# NOTE: These specs use shoulda-matcher's ActionController matchers.
require 'rails_helper'

describe CommentsController do
  let(:new_comment) do
    instance_double(
      'Comment',
      license_plate: license_plate
    )
  end
  let(:license_plate) do
    instance_double 'LicensePlate'
  end
  let(:comment_params) do
    HashWithIndifferentAccess.new(
      fake_attribute: 'hello! fake attribute here!',
      license_plate_id: 821,
      message: 'Your tire is flat!'
    )
  end

  before do
    allow(Comment).to receive(:new).and_return new_comment
  end

  describe '#create' do
    context 'when the comment is saved successfully' do
      before do
        allow(new_comment).to receive(:save).and_return true
        # the #post call needs to come after all stubbing
        post :create, comment: comment_params
      end

      it 'permits the appropriate attributes' do
        params = HashWithIndifferentAccess.new(
          comment: comment_params
        )

        is_expected.to permit(:license_plate_id, :message)
          .for(:create, params: params)
          .on(:comment)
      end
      it 'redirects to the license plate show path' do
        is_expected.to redirect_to(license_plate_path(license_plate))
      end
      it 'sets flash message indicating success' do
        is_expected.to set_flash[:info]
      end
    end

    context 'when the comment is not saved successfully' do
      before do
        allow(new_comment).to receive(:save).and_return false
        allow(new_comment).to receive(:formatted_errors)
          .and_return('Something went wrong!')
        # the #post call needs to come after all stubbing
        post :create, comment: comment_params
      end

      it 'permits the appropriate attributes' do
        params = HashWithIndifferentAccess.new(
          comment: comment_params
        )

        is_expected.to permit(:license_plate_id, :message)
          .for(:create, params: params)
          .on(:comment)
      end
      it 'renders the license_plates/show template' do
        is_expected.to render_template('license_plates/show')
      end
      it 'sets flash errors' do
        is_expected.to set_flash.now[:error]
      end
    end
  end
end
