class PagesController < ApplicationController
  def index
    @time = Time.now
    @user = User.new
    
    if signed_in?
      @highscores = User.select("users.id, users.username, users_stats.player_level").joins(:users_stat).order("users_stats.player_level DESC, users_stats.updated_at ASC").limit(10)
    end
  end

  def about
  end

  def help
  end

end
