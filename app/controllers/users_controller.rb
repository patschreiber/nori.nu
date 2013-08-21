class UsersController < ApplicationController
  def index
    redirect_to  signup_path
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      flash[:success] = "Welcome to nori.nu, #{@user.username}"
    	redirect_to @user
  	else
  	  render 'new'
  	end

  end

  def update
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

end

