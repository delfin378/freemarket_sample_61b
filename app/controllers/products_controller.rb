class ProductsController < ApplicationController
  require 'payjp'
  before_action :set_product, except: [:index, :new, :create]

  def index
    @products = Product.includes(:images).order('created_at DESC').limit(20)
  end

  def new
    @product = Product.new
    @product.images.new

  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path ,notice:"商品出品に成功しました"
    else
      flash[:alert] = "入力情報を確認してください"
      redirect_to new_product_path
    end
  end

  def purchase
    @user = User.find(params[:id])
    @address = current_user.address
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      # 登録された情報がない場合にカード登録画面に移動
      flash[:alert] = '購入前にカード登録してください'
      redirect_to new_card_path
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    if
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      :amount => @product.price, #支払金額を入力
      :customer => card.customer_id, #顧客ID
      :currency => 'jpy', #日本円
    )
    redirect_to action: 'complete' #完了画面に移動
    else
    flash.now[:alert] = '購入に失敗しました'
    render :show
    end
  end

  def complete
    @product_purchaser= Product.find(params[:id])
    @product_purchaser.update( purchaser_id: current_user.id)
  end



  def edit
  end

  def show
    
  end

  def update
    if @product.update(product_params)
      flash.now[:notice] = "商品情報を変更しました"
      render :show
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :show
    end
  end



  private
  def product_params
    params.require(:product).permit(:name, :price,:product_explanation,:category,:brand,:product_situation,:shipping_charges,:shipping_origin,:arrival_days, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end