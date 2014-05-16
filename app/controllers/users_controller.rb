class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    if current_user
      @profile = @user.profile
    end
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		#redirect_to products_url, :notice => "Signed up!"
      #redirect_to new_user_profile_path(:user_id => @user), :notice => "Signed up!"
      redirect_to new_user_profile_path(@user), :notice => "Signed up!"
      #redirect_to root_url(:user_id => @user), :notice => "Signed up!"
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if current_user.update_attributes(user_params)
      redirect_to user_path(@user), :notice => "User Info Updated!"
    else
      render 'edit'  #or :edit
    end
  end 

  private
  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
