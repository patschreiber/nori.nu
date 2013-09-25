class ItemsController < ApplicationController

  def item_cranks
    @user_test = "Yeah"
    @user = User.find(params[:id])
  end
end