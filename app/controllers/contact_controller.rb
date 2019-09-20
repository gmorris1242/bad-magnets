class ContactController < ApplicationController
  rescue_from ActionController::InvalidAuthenticityToken do
    head :not_acceptable
  end

  invisible_captcha only: [:contact], honeypot: :subtitle

  def create
    head(:ok) && return if params[:contact][:subtitle].present?

    ApplicationMailer.contact(contact_params).deliver_now

    render :submit
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :name, :city, :state, :message,
                                    :subtitle)
  end
end
