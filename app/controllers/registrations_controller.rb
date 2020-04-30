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
    session["birthday(1i)"] = params["birthday(1i)"]
    session["birthday(2i)"] = params["birthday(2i)"]
    session["birthday(3i)"] = params["birthday(3i)"]
    @user = User.new
  end

  def new_address
    session[:phone_number] = user_params[:phone_number]
    @address = Address.new
  end

  def new_credit
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
    session["expiration_date(1i)"] = params["expiration_date(1i)"]
    session["expiration_date(2i)"] = params["expiration_date(2i)"]
    session[:securitycord] = card_params[:securitycord]
    @user = User.create(nickname: session[:nickname], email: session[:email], password: session[:password], family_name: session[:family_name], first_name: session[:first_name], family_name_kana: session[:family_name_kana], first_name_kana: session[:first_name_kana], birthday: session[:birthday], phone_number: session[:phone_number])
    @address = Address.create(postal_code: session[:postal_code], prefectures: session[:prefectures], municipalities: session[:municipalities], house_number: session[:house_number], building_name: session[:building_name], house_phone_number: session[:house_phone_number])
    @card = Card.create(card_number: session[:card_number], expiration_date: session[:expiration_date], securitycord: session[:securitycord])
    if @user.save
       @address.save
       @card.save
       @user.update(birthday: birthday_join)
      session[:id] = @user.id
      session[:id] = @address.id
      session[:id] = @card.id
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
  def address_params
    params.require(:address).permit(
      :user_id,
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
      :expiration_date,
      :securitycord,
    )
    end
    def expiration_date_join
      date = params[:expiration_date]
      Date.new date[expiration_date(1i)].to_i,date[expiration_date(2i)].to_i
    end  
  end

