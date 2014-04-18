class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def create
  	@product = Product.new(product_params)

  	if @product.save
  		redirect_to products_url  #or can this be products_path?
  	else
  		render 'new'  #or :new
  	end
  end

  def update
  	@product = Product.find(params[:id])

  	if @product.udpate_attributes(product_params)
  		redirect_to product_path(@product)
  	else
  		render 'edit'  #or :edit
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_path
  end

private
def product_params
	params.require(:product).permit(:name, :description, :price_in_cents)
end

end