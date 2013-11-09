class PagesController < ApplicationController
  def index
    @time = Time.now
    @user = User.new
    
    if signed_in?
      @highscores = User.joins(:users_stat).select("users.id, users.username, users_stats.player_level").limit(10)
      #@highscores = User.select("users.id, users.username, users_stats.player_level").joins(:users_stats).order("users_stats.player_level DESC, users_stats.updated_at ASC").limit(10)
    end
  end

end
