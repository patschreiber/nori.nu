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
    if signed_in?
      redirect_to root_url
    else
      @user = User.new
    end
  end

  def create
    action = "Create"
  	@user = User.new( user_params )

  	if @user.save
      @user_stats = UsersStat.new(  :id => @user.id,
                                    :user_id => @user.id,
                                    :player_level => 1, 
                                    :current_experience => 0, 
                                    :total_experience => 0, 
                                    :current_gold => 0,
                                    :health => 100,
                                    :attack => 1,
                                    :defense => 1,
                                    :stealth => 1,
                                    :luck => 1,
                                    :total_items_found => 0,
                                    :total_buttons_clicked => 0,
                                    :total_gold_collected => 0 
                                  )
      @user_stats.save!
      @users_equipped_items = UsersEquippedItem.new( :id => @user.id,
                                                    :slot_1_is_equipped => false,
                                                    :slot_2_is_equipped => false,
                                                    :slot_3_is_equipped => false,
                                                    :slot_4_is_equipped => false,
                                                    :slot_5_is_equipped => false,
                                                    :slot_6_is_equipped => false,
                                                    :slot_7_is_equipped => false 
                                                  )
      @users_equipped_items.save!

      sign_in @user
      flash[:success] = "Welcome to nori.nu, #{@user.username}"
    	redirect_to game_path
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash.now[:success] = "Successfully updated information"
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
    @user = User.find( params[:id] )
    @user_stats = UsersStat.find_by user_id: @user.id
    @level = @user_stats.player_level
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
    @user = User.find( params[:id] )
    redirect_to(root_url) unless current_user?(@user)
  end

end

