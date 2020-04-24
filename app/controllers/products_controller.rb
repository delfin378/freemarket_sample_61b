class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :edit]
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
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  def edit
   @product = Product.find(params[:id])
  end

  def show
   @product = Product.find(params[:id])
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name, :price,:product_explanation,:category,:brand,:product_situation,:shipping_charges,:shipping_origin,:arrival_days, images_attributes: [:src, :_destroy, :id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

end