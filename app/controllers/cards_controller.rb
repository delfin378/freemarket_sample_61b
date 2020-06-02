class CardsController < ApplicationController
  require 'payjp'

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to card_path(current_user.id) if card.exists?
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    if params['payjp-token'].blank?
      render :new
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        flash.now[:notice] = "カードの登録に成功しました"
        render :show
      else
        flash[:alert] = 'カードの登録に失敗しました'
        render :new
      end
    end
  end

  def destroy #PayjpとCardデータベースを削除
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      render :new
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      flash[:notice] = 'カードが削除されました'
      redirect_to root_path
  end


  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      # 登録された情報がない場合にカード登録画面に移動
      redirect_to new_card_path
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  private

  def card_params
  params.require(:card).permit(:user_id, :customer_id, :card_id).merge(user_id: current_user.id)
  end

end
