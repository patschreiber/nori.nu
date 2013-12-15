class InventoryController < ApplicationController

  def inventory_add
    @user = User.find current_user
    @item_id = params[:id].to_i
    @item_name = params[:name].to_s
    @tier = params[:tier].to_i
    @is_set = params[:is_set]
    @set_id = params[:set_id]
    @set_item_number = params[:set_item_number]
    @is_unique = params[:is_unique]
    @prefix = params[:prefix]
    @suffix = params[:suffix]
    @min_equip_player_level = params[:min_equip_player_level]
    @value = params[:value]
    @attack_val = params[:attack_val]
    @defense_val = params[:defense_val]
    @luck_val = params[:luck_val]
    @stealth_val = params[:stealth_val]
    @flavor_text = params[:flavor_text]
    @is_in_inventory = UsersCurrentInventory.find_by_user_id_and_item_id( @user.id, @item_id )

    if @is_in_inventory.nil?
      @item = UsersCurrentInventory.new(
        :user_id => @user.id,
        :item_id => @item_id,
        :name => @item_name,
        :tier => @tier,
        :min_equip_player_level => @min_equip_player_level,
        :computed_attack => @attack_val,
        :computed_defense => @defense_val,
        :computed_luck => @luck_val,
        :computed_stealth => @stealth_val,
        :flavor_text => @flavor_text,
        :quantity => 1,
        :value => @value
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