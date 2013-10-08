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
      @next_level_experience = @user_stats.total_experience
    end
  end

  def update_stats
    level = params[:level].to_i
    current_exp = params[:current_experience].to_i
    total_exp = params[:total_experience].to_i

    @user = User.find(current_user)
    @user_stats = UsersStat.find_by user_id: @user.id


    unless level == 99
      level = level + 1
      current_exp = current_exp + 50
      total_exp = total_exp + 50

      @user_stats.player_level = level
      @user_stats.current_experience = current_exp
      @user_stats.total_experience = total_exp
      @user_stats.save!


      data = { :message => "You leveled up!", :level => level, :current_exp => current_exp, :total_exp => total_exp }
      render :json => data, :status => :ok
    else
      data = { :message => "You've reached the max level!", :level => level }
      render :json => data, :status => :ok
    end
  end

  def levelup(current_exp, total_exp, level)

  end

end