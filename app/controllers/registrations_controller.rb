class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def new_phone
    session[:nickname] = params[:user][:nickname]
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    session[:family_name] = params[:user][:family_name]
    session[:first_name] = params[:user][:first_name]
    session[:family_name_kana] = params[:user][:family_name_kana]
    session[:first_name_kana] = params[:user][:first_name_kana]
    session[:birthday] = "#{params[:user]['birthday(1i)']}/#{params[:user]['birthday(2i)']}/#{params[:user]['birthday(3i)']}"
    @phone = Phone.new
  end

  def new_address
    session[:phone_number] = params[:phone][:phone_number]
    @address = Address.new
  end

  def complete
    session[:postal_code] = params[:address][:postal_code]
    session[:prefectures] = params[:address][:prefectures]
    session[:municipalities] = params[:address][:municipalities]
    session[:house_number] = params[:address][:house_number]
    session[:building_name] = params[:address][:building_name]
    session[:house_phone_number] = params[:address][:house_phone_number]
    @user = User.create(nickname: session[:nickname], email: session[:email], password: session[:password], family_name: session[:family_name], first_name: session[:first_name], family_name_kana: session[:family_name_kana], first_name_kana: session[:first_name_kana], birthday: session[:birthday])
    @phone = Phone.create(phone_number: session[:phone_number])
    @address = Address.create(postal_code: session[:postal_code], prefectures: session[:prefectures], municipalities: session[:municipalities], house_number: session[:house_number], building_name: session[:building_name], house_phone_number: session[:house_phone_number],user_id: @user.id)
    if @user.save
       @phone.save
       @address.save
      session[:id] = @user.id
      session[:id] = @address.id
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password, 
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :birthday,
    )
  end 
  def birthday_join
    date = params[:user][:birthday]
    Date.new date[:birthday1i].to_i,date[:birthday2i].to_i,date[:birthday3i].to_i
  end
  def phone_params
    params.require(:phone).permit(
      :phone_number,
    )
  end
  def address_params
    params.require(:address).permit(
      :postal_code,
      :prefectures,
      :municipalities,
      :house_number,
      :building_name,
      :house_phone_number,
    )
  end
end

