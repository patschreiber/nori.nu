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
    end
  end

  def update_stats
    level = params[:level].to_i

    @user = User.find(current_user)
    @user_stats = UsersStat.find_by user_id: @user.id


    unless level == 99
      level = level + 1
      @user_stats.player_level = level
      @user_stats.save!
      data = { :message => "You leveled up!", :level => level }
      render :json => data, :status => :ok
    else
      data = { :message => "You've reached the max level!", :level => level }
      render :json => data, :status => :ok
    end
  end
end