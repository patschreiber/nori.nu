class PagesController < ApplicationController
  def index
    @time = Time.now
    @user = User.new
    
    if signed_in?
      @highscores = User.select("users.id, users.username, users_stats.player_level").joins(:users_stat).order("users_stats.player_level DESC")
    end
  end

end
