# encoding: utf-8
# frozen_string_literal: true
class LicensePlatesController < ApplicationController
  def index
    @license_plates = LicensePlate.all
  end

  def new
    @license_plate = LicensePlate.new
  end

  def create
    @license_plate = LicensePlate.new(permitted_params)
    if @license_plate.save
      redirect_to license_plate_path(@license_plate)
    else
      # TODO: set flash messages
      render 'new'
    end
  end

  # TODO: Add redirect and error message if LicensePlate cannot be found
  def show
    license_plate = LicensePlate.find_by(id: license_plate_id)
    if license_plate
      @license_plate = LicensePlatePresenter.new(license_plate)
    else
      handle_record_not_found('License plate')
    end
  end

  def edit
  end

  def update
  end

  private def license_plate_id
    params.require(:id)
  end

  private def permitted_params
    params.require(:license_plate).permit(
      :id,
      :jurisdiction_id,
      :identifier
    )
  end
end
