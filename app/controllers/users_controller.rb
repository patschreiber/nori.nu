class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :show, :update]
  before_action :correct_user, only: [:edit, :show, :update]



  def index
    if signed_in?
      redirect_to show
    else
      redirect_to  signup_path
    end
  end

  def new
  	@user = User.new
  end

  def create
    action = "Create"
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
      flash[:success] = "Welcome to nori.nu, #{@user.username}"
    	redirect_to @user
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Successfully updated information"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def delete
  end

  def show
    @user_title = "\'s Profile"
    @user = User.find(params[:id])
  end

  private

  def user_params
  	params.require(:user).permit(:last_name, :first_name, :username, :email, :password, :password_confirmation)
  end

  # Before filters

  def signed_in_user  
    unless signed_in?
      store_location 
      flash[:notice] = "Please sign in" 
      redirect_to root_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end

