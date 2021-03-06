class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by( username: params[:session][:username].downcase )
    if user && user.authenticate( params[:session][:password] )
      sign_in user  # sign_in(user)
      redirect_back_or game_path
    else
      flash.now[:error] = 'Invalid username or password'
      render :template => 'pages/index'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
