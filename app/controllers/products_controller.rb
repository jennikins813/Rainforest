class ProductsController < ApplicationController
  before_filter :ensure_logged_in, :only => [:show]
  
  def index
  	@products = if params[:search]
      Product.where("name LIKE ?", "%#{params[:search]}%")
    else
      Product.all
    end

    @products = @products.page(params[:page]).order("created_at ASC")    #this is for the pagination

    respond_to do |format|
      format.html
      format.js
      #format.json { render json: @products }
      #line 16 allows controller action to respond to json
    end
  end

  def show
  	@product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end
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

  	if @product.update_attributes(product_params)
  		redirect_to product_path(@product), :notice => "Product updated!"
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
