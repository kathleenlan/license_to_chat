# encoding: utf-8
# frozen_string_literal: true
class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:info] = 'Comment posted successfully!'
      redirect_to license_plate_path(comment.license_plate)
    else
      flash.now[:error] = "Unable to post comment. #{comment.formatted_errors}"
      @license_plate = LicensePlatePresenter.new(comment.license_plate)
      render 'license_plates/show'
    end
  end

  private def comment_params
    params.require(:comment).permit(
      :id,
      :license_plate_id,
      :message
    )
  end
end
