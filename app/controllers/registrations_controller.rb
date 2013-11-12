class RegistrationsController < Devise::RegistrationsController

  def index
    if user_signed_in?
      redirect_to show
    else
      redirect_to  signup_path
    end
  end

  def new
    super
  end

  def create
    super
    @user_stats = UsersStat.new(  :user_id => @user.id, 
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
    @users_equipped_items = UsersEquippedItem.new( :user_id => @user.id,
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
    @user = User.find( current_user )
    @user_stats = UsersStat.find_by user_id: @user.id
    @level = @user_stats.player_level
  end

end
