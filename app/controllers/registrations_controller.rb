class RegistrationsController < Devise::RegistrationsController

  def index
    if user_signed_in?
      redirect_to show
    else
      redirect_to  signup_path
    end
  end

  def new
  end

  def create

    build_resource(sign_up_params)

    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      render :template => 'pages/index'
    end


    @user_stats = UsersStat.new(  
      :user_id => @user.id, 
      :player_level => 1, 
      :current_experience => 0, 
      :total_experience => 0, 
      :current_gold => 0,
      :current_area_selected => 1,
      :health => 100,
      :attack => 1,
      :defense => 1,
      :stealth => 1,
      :luck => 1,
      :total_items_found => 0,
      :areas_unlocked => 1,
      :total_buttons_clicked => 0,
      :total_gold_collected => 0
    )

    @users_equipped_items = UsersEquippedItem.new( 
      :user_id => @user.id,
      :slot_1_is_equipped => false,
      :slot_2_is_equipped => false,
      :slot_3_is_equipped => false,
      :slot_4_is_equipped => false,
      :slot_5_is_equipped => false,
      :slot_6_is_equipped => false,
      :slot_7_is_equipped => false
    )

    @users_areas = UsersArea.new( 
      :user_id => @user.id,
      :is_area_1_unlocked => true,
      :is_area_2_unlocked => false,
      :is_area_3_unlocked => false,
      :is_area_4_unlocked => false,
      :is_area_5_unlocked => false
    )

    begin
      if resource.save
        @user_stats.save
        @users_equipped_items.save
        @users_areas.save
        UserWelcomeMailer.user_welcome(resource.as_json).deliver
        sign_in @user
        flash[:success] = "Welcome to #{application_name.capitalize}, #{@user.username}"
      else
        redirect_to root_path
      end
    rescue => e 
      logger.error e.message
      e.backtrace.each { |line| logger.error line }
      flash[:error] = "There was an error during signup. Please try again."
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
    @user = User.find( current_user )
    @user_stats = UsersStat.find_by user_id: @user.id
    @level = @user_stats.player_level
    @user_inventory = UsersCurrentInventory.where( user_id: @user.id )

    @user_equipped_items = UsersEquippedItem.find_by user_id: @user.id

    if @user_equipped_items.slot_1_is_equipped?
      @slot_1_item = @user_equipped_items.slot_1
    else
      @slot_1_item = nil
    end

    if @user_equipped_items.slot_2_is_equipped?
      @slot_2_item = @user_equipped_items.slot_2
    else
      @slot_2_item = nil
    end

    if @user_equipped_items.slot_3_is_equipped?
      @slot_3_item = @user_equipped_items.slot_3
    else
      @slot_3_item = nil
    end

    if @user_equipped_items.slot_4_is_equipped?
      @slot_4_item = @user_equipped_items.slot_4
    else
      @slot_4_item = nil
    end

    if @user_equipped_items.slot_5_is_equipped?
      @slot_5_item = @user_equipped_items.slot_5
    else
      @slot_5_item = nil
    end

    if @user_equipped_items.slot_6_is_equipped?
      @slot_6_item = @user_equipped_items.slot_6
    else
      @slot_6_item = nil
    end

    if @user_equipped_items.slot_7_is_equipped?
      @slot_7_item = @user_equipped_items.slot_7
    else
      @slot_7_item = nil
    end
  end

end

