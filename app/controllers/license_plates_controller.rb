# encoding: utf-8
# frozen_string_literal: true
class LicensePlatesController < ApplicationController
  def index
    @q = LicensePlate.ransack(params[:q])
    @license_plates = @q.result.includes(:comments).ordered.page(current_page)
  end

  def new
    license_plate = LicensePlate.new
    @license_plate = LicensePlatePresenter.new(license_plate)
  end

  def create
    license_plate = LicensePlate.new(permitted_params)
    if license_plate.save
      flash[:info] = 'License plate added successfully!'
      redirect_to license_plate_path(license_plate)
    else
      flash.now[:error] = 'Unable to save license plate. '\
        "#{license_plate.formatted_errors}"
      @license_plate = LicensePlatePresenter.new(license_plate)
      render 'new'
    end
  end

  def show
    license_plate = LicensePlate.find_by(id: params[:id])
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

  private def permitted_params
    params.require(:license_plate).permit(
      :id,
      :jurisdiction_id,
      :identifier
    )
  end

  # Note: If params[:page] is nil, then Kaminari's .page method will default to
  # retrieving the first page.
  private def current_page
    params[:page]
  end
end
