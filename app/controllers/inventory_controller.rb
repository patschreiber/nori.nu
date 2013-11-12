class InventoryController < ApplicationController

  def inventory_add
    @user = User.find current_user
    item_id = params[:id].to_i
    @duplicate_item = UsersCurrentInventory.find_by(current_user.id, item_id)
    Rails.logger.debug @duplicate_item.item_id
    Rails.logger.debug "Current User=#{current_user.id}"
    Rails.logger.debug "Item ID=#{item_id}"
    
    if @duplicate_item.nil?
      @new_item = UsersCurrentInventory.new
      @new_item.user_id = current_user.id
      @new_item.item_id = item_id
      @new_item.quantity = 1
      @new_item.save!
    else
      @duplicate_item.quantity = 2
      @duplicate_item.save!
    end

  end

  def update
  end

  def delete
  end

end