class EmailListController < ApplicationController
  rescue_from ActionController::InvalidAuthenticityToken do
    head :not_acceptable
  end

  invisible_captcha only: [:email_list], honeypot: :subtitle

  def create
    head(:ok) && return if params[:email_list][:subtitle].present?

    ApplicationMailer.email_list(email_list_params).deliver_now

    render :submit
  end

  private

  def email_list_params
    params.require(:email_list).permit(:email, :name, :city, :state, :subtitle)
  end
end
