class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private

  def production?
    Rails.env.production?
  end


  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  
  # protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :nickname, :family_name, :first_name,:family_name_kana, :first_name_kana, :phone_number, :birthday, :postal_code, :prefectures, :municipalities, :house_number, :building_name, :house_phone_number, :card_number, :expiration_date, :securitycord ])
    end
  end
end