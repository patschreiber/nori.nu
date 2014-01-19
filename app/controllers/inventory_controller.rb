class InventoryController < ApplicationController

  def inventory_add
    @user = User.find current_user
    @save = params[:save_item].to_i

    if @save
      @item_id = session[:base_item_id]
      @item_name = session[:name]
      @is_equippable = session[:is_equippable]
      @min_equip_player_level =  session[:min_equip_player_level]
      @tier = session[:tier]
      @equip_slot = session[:equip_slot]
      @uses_ammo = session[:uses_ammo]
      @ammo_type = session[:ammo_type]
      @is_consumable = session[:is_consumable]
      @is_currency = session[:is_currency]
      @is_set = session[:is_set]
      @set_id = session[:set_id]
      @set_item_number = session[:set_item_number]
      @value = session[:value]
      @is_unique = session[:is_unique]
      @can_have_prefix = session[:can_have_prefix]
      @can_have_suffix = session[:can_have_suffix]
      @attack_val = session[:computed_attack]
      @defense_val = session[:computed_defense]
      @stealth_val = session[:computed_stealth]
      @luck_val = session[:computed_luck]
      @flavor_text = session[:flavor_text]

      @is_in_inventory = UsersCurrentInventory.find_by_user_id_and_item_id( @user.id, @item_id )

      if @is_in_inventory.nil?
        @item = UsersCurrentInventory.new(
          :user_id => @user.id,
          :item_id => @item_id,
          :is_equippable => @is_equippable,
          :name => @item_name,
          :tier => @tier,
          :equip_slot => @equip_slot,
          :uses_ammo => @uses_ammo,
          :ammo_type => @ammo_type,
          :is_consumable => @is_consumable,
          :min_equip_player_level => @min_equip_player_level,
          :computed_attack => @attack_val,
          :computed_defense => @defense_val,
          :computed_stealth => @stealth_val,
          :computed_luck => @luck_val,
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
  end

  def equip
  end

  def update
  end

  def delete
  end

end