class InventoryController < ApplicationController

  def inventory_add
    @user = User.find current_user
  end

  def update
  end

  def delete
  end

end