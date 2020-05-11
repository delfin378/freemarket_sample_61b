class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]
  def index
    @products = Product.includes(:images).order('created_at DESC')
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
      flash[:alert] = "商品出品に失敗しました"
      redirect_to new_product_path
    end
  end

  def purchase
  
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
    params.require(:product).permit(:name, :price,:product_explanation,:category,:brand,:product_situation,:shipping_charges,:shipping_origin,:arrival_days, images_attributes: [:src, :_destroy, :id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

end