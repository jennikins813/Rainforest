class ProfilesController < ApplicationController
  before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]
  before_filter :get_user

  def index
  end

  def show
    @user = User.find(params[:user_id])
    if @user
      render 'show'
    else
    end
  end

  #def show
  #  @profile = Profile.find(params[:user_id])
  #  if current_user
  #    @profile = @user.profile.build
  #  end
  #end

  def new
    @user = User.find(params[:user_id])
    @profile = @user.profile.build
  end

  def create
    #@user = User.find(params[:user_id])
    @profile = @user.profiles.build(profile_params)
    @profile.user_id = current_user.id

    if @profile.save
      redirect_to root_url, :notice => "Profile created!"
    else
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def profile_params
    params.require(:profile).permit(:user_id, :name, :image, :bio, :website)
  end

  def get_user
  @user = User.find(params[:user_id])
  end
end


