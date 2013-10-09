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

      unless @level == 99
        @level_table = Level.find_by level: @user_stats.player_level + 1    # Finds experience required for next level
      else
        @level_table = Level.find_by level: @user_stats.player_level
      end

      @next_level_experience = @level_table.experience_required 
      
      # Used for experience progress bar
      @percent_to_level = percent_to_next_level(@current_experience, @next_level_experience)

    end
  end



  def update_stats
    @user = User.find(current_user)
    @user_stats = UsersStat.find_by user_id: @user.id
    @level_table = Level.find_by level: @user_stats.player_level + 1

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
    #Pseudo Code

    current_exp = current_exp + exp_to_add

    unless level == 99

      if current_exp >= next_level_required_exp
        level = level + 1
        remainder = current_exp - next_level_required_exp
        current_exp = 0 + remainder
        @next_level_if_leveled_up = Level.find_by level: level + 1
        next_level_experience = @next_level_if_leveled_up.experience_required
       
        # Implicit Return
        [current_exp, next_level_experience, level]
      else
        level = level
        @next_level_if_leveled_up = Level.find_by level: level + 1
        next_level_experience = @next_level_if_leveled_up.experience_required

        # Implicit Return
        [current_exp, next_level_experience, level]
      end

    end
  end

  def percent_to_next_level(current_exp, next_level_exp)
    return (current_exp.to_f / next_level_exp.to_f * 100).round(1)
  end
end