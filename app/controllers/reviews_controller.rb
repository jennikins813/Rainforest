class ReviewsController < ApplicationController
  before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]
	before_filter :load_product

  def show
  	@review = Review.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
  	@review = @product.reviews.build(review_params)
  	@review.user_id = current_user.id

    respond_to do |format|
    	if @review.save
        format.html do
          if request.xhr?
            return render @review
          else
      		  redirect_to products_path(@product.id), notice: "Review created successfully!"
          end
        end
        format.js {}
    	else
    		#format.html {render 'show'}
        format.html {render 'products/show', alert: 'There was an error.'}
        format.js {}
    	end
    end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end

  private
  def review_params
  	params.require(:review).permit(:comment, :product_id)
  end

  def load_product
  	@product = Product.find(params[:product_id])
  end

end
