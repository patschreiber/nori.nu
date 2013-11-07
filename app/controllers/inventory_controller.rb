class InventoryController < ApplicationController

  def inventory_add
    @user = User.find current_user
    @users_inventory = UsersCurrentInventory.find_by id: @user.id #This may not work to find the user ID
    item_id = params[:id].to_i


  end

  def update
  end

  def delete
  end

end