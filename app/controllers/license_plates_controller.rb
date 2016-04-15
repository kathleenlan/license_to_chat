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

  def show
    @license_plate = LicensePlate.find license_plate_id
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
