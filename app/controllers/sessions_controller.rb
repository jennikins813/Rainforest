class SessionsController < ApplicationController
  def new
  end
  #dont need to instantiate a user object in new since we're only logging in, not creating a new user.

  def create
  	user = User.find_by_email(params[:email])

  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to products_url, :notice => "Logged in!"
  	else
  		flash.now[:alert] = "Invalid email or password"
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to products_url, :notice => "Logged out!"
  end
end
