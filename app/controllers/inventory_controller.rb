class InventoryController < ApplicationController

  def inventory_add
    @user = User.find current_user
    @item_id = params[:id].to_i
    @item_name = params[:name].to_s
    @is_in_inventory = UsersCurrentInventory.find_by_user_id_and_item_id( @user.id, @item_id )

    if @is_in_inventory.nil?
      @item = UsersCurrentInventory.new(
        :user_id => @user.id,
        :item_id => @item_id,
        :quantity => 1
      )
      @item.save!
    elsif @is_in_inventory.item_id == 10001 #Make this more robust so you dont have to hardcode values 
      @item = @is_in_inventory
      @item.quantity = @item.quantity + 1
      @item.save!
    else
      return
    end

  end

  def update
  end

  def delete
  end

end