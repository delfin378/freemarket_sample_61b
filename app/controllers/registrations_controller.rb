class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def new_phone
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday] = user_params[:birthday]
    @user = User.new
  end

  def new_address
    session[:phone_number] = user_params[:phone_number]
    @address = Address.new
  end

  def new_credit
    session[:family_name] = address_params[:family_name]
    session[:first_name] = address_params[:first_name]
    session[:family_name_kana] = address_params[:family_name_kana]
    session[:first_name_kana] = address_params[:first_name_kana]
    session[:postal_code] = address_params[:postal_code]
    session[:prefectures] = address_params[:prefectures]
    session[:municipalities] = address_params[:municipalities]
    session[:house_number] = address_params[:house_number]
    session[:building_name] = address_params[:building_name]
    session[:house_phone_number] = address_params[:house_phone_number]
    @card = Card.new
  end


  def complete
    session[:card_number] = card_params[:card_number]
    session[:expiration_date] = card_params[:expiration_date]
    session[:securitycord] = card_params[:securitycord]
    @user = User.create(nickname: session[:nickname], email: session[:email], password: session[:password], family_name: session[:family_name], first_name: session[:first_name], family_name_kana: session[:family_name_kana], first_name_kana: session[:first_name_kana], birthday: session[:birthday], phone_number: session[:phone_number])
    @address = Address.create(family_name: session[:family_name], first_name: session[:first_name], family_name_kana: session[:family_name_kana], first_name_kana: session[:first_name_kana], postal_code: session[:postal_code], prefectures: session[:prefectures], municipalities: session[:municipalities], house_number: session[:house_number], building_name: session[:building_name], house_phone_number: session[:house_phone_number])
    @card = Card.create(card_number: session[:card_number], expiration_date: session[:expiration_date], securitycord: session[:securitycord])
    params[:birthday] = birthday_join
    if @user.save
       @address.save
       @card.save
      session[:id] = @user.id
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password, 
      :password_confirmation, 
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :phone_number,
      :birthday,
      :profile,
      :icon
    )
  end
  def birthday_join
    date = params[:user][:birthday]
    Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
  end  
  def birthday_join
    date = params[:birthday]
  end
  def address_params
    params.require(:address).permit(
      :user_id,
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :postal_code,
      :prefectures,
      :municipalities,
      :house_number,
      :building_name,
      :house_phone_number,
    )
  end
  def card_params
    params.require(:card).permit(
      :user_id,
      :card_number,
      :expiration_month,
      :expiration_year,
      :securitycord,
    )
    end
  end

