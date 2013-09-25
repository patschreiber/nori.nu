class GameController < ApplicationController

  def index
    @user = User.find(current_user)

    @user_stats = UsersStat.find(:first, :conditions => [ "user_id", @user.id ])
    @level = @user_stats.player_level
    @gold = @user_stats.current_gold
    @health = @user_stats.health
  end
end