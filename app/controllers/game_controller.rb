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

      # Used for experience progress bar
      @next_level_experience = @level_table.experience_required      
      @percent_to_level = percent_to_next_level(@current_experience, @next_level_experience)
    end
  end


  def update_stats
    @user = User.find(current_user)
    @user_stats = UsersStat.find_by user_id: @user.id

    level = params[:level].to_i
    current_exp = params[:current_experience].to_i
    exp_to_add = params[:experience_to_add].to_i

    if level < 99
      next_level_experience = (Level.find_by level: @user_stats.player_level + 1).experience_required
    else
      next_level_experience = Level.find(99)
    end

    # Now we update the values with the levelup and percent to level methods
    current_exp, next_level_experience, level = levelup( current_exp, next_level_experience, level, exp_to_add ) 
    percent_to_level = percent_to_next_level(current_exp, next_level_experience)

    @user_stats.player_level = level
    @user_stats.current_experience = current_exp
    @user_stats.total_experience = @user_stats.total_experience + exp_to_add
    @user_stats.save!


    data = { :message => "You leveled up!", :level => level, :current_exp => current_exp, :exp_to_level => next_level_experience, :percent_to_level => percent_to_level }
    render :json => data, :status => :ok
  end


  def levelup(current_exp, next_level_experience, level, exp_to_add)

    current_exp = current_exp + exp_to_add

    if level < 98
      if current_exp >= next_level_experience
        level = level + 1
        next_level = Level.find_by level: level + 1
        remainder = current_exp - next_level_experience
        current_exp = 0 + remainder
        next_level_experience = next_level.experience_required
       
        # Implicit Return
        [current_exp, next_level_experience, level]
      else 
        level = level    
        next_level_experience = (Level.find_by level: level + 1).experience_required

        # Implicit Return
        [current_exp, next_level_experience, level]
      end

    elsif level === 98
      if current_exp >= next_level_experience
        level = level + 1
        next_level = Level.find(99)
        current_exp = next_level.experience_required

        # Implicit Return
        [current_exp, next_level_experience, level]
      else
        level = level    
        next_level_experience = (Level.find_by level: level + 1).experience_required

        # Implicit Return
        [current_exp, next_level_experience, level]
      end 


    elsif level == 99
      @level_experience = Level.find(99)

      level = level
      next_level_experience = @level_experience.experience_required
      current_exp = @level_experience.experience_required

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




     # @level_table = Level.find_by level: @user_stats.player_level + 1