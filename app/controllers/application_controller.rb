# encoding: utf-8
# frozen_string_literal: true
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def handle_record_not_found(record_name)
    flash[:error] = "#{record_name} could not be found."
    redirect_to root_path
  end
end
