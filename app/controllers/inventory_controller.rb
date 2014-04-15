class InventoryController < ApplicationController

  def inventory_add
    @user = User.find current_user
    @save = params[:save_item].to_i

    if @save && session[:item] != nil
      @item_id = session[:item][:base_item_id]
      @item_name = session[:item][:name]
      @is_equippable = session[:item][:is_equippable]
      @min_equip_player_level =  session[:item][:min_equip_player_level]
      @tier = session[:item][:tier]
      @equip_slot = session[:item][:equip_slot]
      @is_consumable = session[:item][:is_consumable]
      @is_currency = session[:item][:is_currency]
      @is_set = session[:item][:is_set]
      @set_id = session[:item][:set_id]
      @set_item_number = session[:item][:set_item_number]
      @value = session[:item][:value]
      @is_unique = session[:item][:is_unique]
      @can_have_prefix = session[:item][:can_have_prefix]
      @can_have_suffix = session[:item][:can_have_suffix]
      @attack_val = session[:item][:computed_attack]
      @defense_val = session[:item][:computed_defense]
      @stealth_val = session[:item][:computed_stealth]
      @luck_val = session[:item][:computed_luck]
      @flavor_text = session[:item][:flavor_text]

      @is_in_inventory = UsersCurrentInventory.find_by_user_id_and_item_id( @user.id, @item_id )

      if @is_in_inventory.nil?
        @item = UsersCurrentInventory.new(
          :user_id => @user.id,
          :item_id => @item_id,
          :is_equippable => @is_equippable,
          :name => @item_name,
          :tier => @tier,
          :equip_slot => @equip_slot,
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
        session.delete(:item)
        
      elsif @is_in_inventory
        @item = @is_in_inventory
        @item.quantity = @item.quantity + 1
        @item.save!
        session.delete(:item)
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