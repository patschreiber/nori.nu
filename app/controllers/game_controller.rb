class GameController < ApplicationController


  def index
    unless signed_in?
      redirect_to root_path
    end

    if signed_in?
      @user = User.find(current_user)
      @user_id = @user.id
      @user_stats = UsersStat.find_by user_id: @user.id
      @level = @user_stats.player_level 
      @current_experience = @user_stats.current_experience

      if @level < 99
        @level_table = Level.find_by level: @user_stats.player_level + 1    # Finds experience required for next level
      elsif @level == 99
        @level_table = Level.find(99)
      end

      @next_level_experience = @level_table.experience_required 
      
      # Used for experience progress bar
      @percent_to_level = percent_to_next_level(@current_experience, @next_level_experience)
    end
  end

  def item_roll
    @user = User.find(current_user)
    @user_stats = UsersStat.find_by user_id: @user.id
    @player_level = @user_stats.player_level
    @max_item_tier = 0

    # First, get item_tier player is allowed to roll from
    if @user_stats.player_level <= 25
      @max_item_tier = 3
    elsif @user_stats.player_level <= 45
      @max_item_tier = 4
    elsif @user_stats.player_level <= 75
      @max_item_tier = 5  
    end
      
    # Gets the item_tier that the pool of items will be drawn from
    #item_tier = rand(1..@max_item_tier).round
  end

  def update_stats
    @user = User.find(current_user)
    @user_stats = UsersStat.find_by user_id: @user.id

    if @user_stats.player_level < 99
      @level_table = Level.find_by level: @user_stats.player_level + 1
    else
      @level_table = Level.find(99)
    end

    level = params[:level].to_i
    current_exp = params[:current_experience].to_i
    exp_to_add = params[:experience_to_add].to_i
    next_level_experience = @level_table.experience_required 

    current_exp, next_level_experience, level = levelup( current_exp, next_level_experience, level, exp_to_add ) 
    percent_to_level = percent_to_next_level(current_exp, next_level_experience)

    @user_stats.player_level = level
    @user_stats.current_experience = current_exp
    @user_stats.total_experience = @user_stats.total_experience + exp_to_add
    @user_stats.save!


    data = { :message => "You leveled up!", :level => level, :current_exp => current_exp, :exp_to_level => next_level_experience, :percent_to_level => percent_to_level }  # Sends data back to the AJAX request
    render :json => data, :status => :ok
  end


  def levelup(current_exp, next_level_required_exp, level, exp_to_add)
    # If current level < 99 -
    # Check to see if the current experience > the required exp for the next level
    # If it is, add the remainer and find the next level experience required
    # If next level experience != enough to level up, set the level the same and the next level experience
    # 
    # If current level = 99
    # Next level experience = 99

    current_exp = current_exp + exp_to_add

    if level < 99
      @next_level_if_leveled_up = Level.find_by level: level + 1

      if current_exp >= next_level_required_exp
        level = level + 1
        remainder = current_exp - next_level_required_exp
        current_exp = 0 + remainder
        next_level_experience = @next_level_if_leveled_up.experience_required
       
        # Implicit Return
        [current_exp, next_level_experience, level]
      else
        level = level

        # Implicit Return
        [current_exp, level]
      end

    elsif level == 99
      @level_experience = Level.find(99)

      level = level
      next_level_experience = @level_experience.experience_required
      current_exp = @level_experience.experience_required

      Rails.logger.debug "current_exp= #{current_exp}"
      Rails.logger.debug "next_level_exp = #{next_level_experience}"

      #Implicit Return
      [current_exp, next_level_experience, level]

    else
      Rails.logger.debug "Logic Error: Not less than or equal to 99"
    end
  end

  def percent_to_next_level(current_exp, next_level_exp)
    return (current_exp.to_f / next_level_exp.to_f * 100).round(1)
  end
end