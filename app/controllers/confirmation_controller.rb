# frozen_string_literal: true

class ConfirmationController < ApplicationController
  GROUP_ID = 201246423

  before_action :confirmation_params
  skip_before_action :verify_authenticity_token

  def confirm
    head 400 if confirmation_params[:type] != 'confirmation'
    head 400 if confirmation_params[:group_id] != GROUP_ID

    render json: ENV['VK_CONFIRMATION_KEY']
  end

  private

  def confirmation_params
    params.require(:confirmation).permit(%i[type group_id])
  end
end
