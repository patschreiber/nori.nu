class ItemsController < ApplicationController

  def item_crank

    @item = generate_item()  # Gets the item from the database.
    render :json => @item, :status => :ok
  end

  def generate_item()
    # TODO Generate item by player level and luck. Generate formula to do this.
    
    item_from_database = Item.offset(rand(Item.count)).first

    base_item = GameFoundItem.new
    base_item.base_item_id           = item_from_database.id
    base_item.name                   = item_from_database.name
    base_item.is_equippable          = item_from_database.is_equippable
    base_item.min_equip_player_level = item_from_database.min_equip_player_level
    base_item.tier                   = item_from_database.tier
    base_item.equip_slot             = item_from_database.equip_slot
    base_item.uses_ammo              = item_from_database.uses_ammo
    base_item.ammo_type              = item_from_database.ammo_type
    base_item.is_consumable          = item_from_database.is_consumable
    base_item.is_currency            = item_from_database.is_currency
    base_item.is_set                 = item_from_database.is_set
    base_item.set_id                 = item_from_database.set_id
    base_item.set_item_number        = item_from_database.set_item_number
    base_item.value                  = item_from_database.value
    base_item.is_unique              = item_from_database.is_unique
    base_item.can_have_prefix        = item_from_database.can_have_prefix
    base_item.can_have_suffix        = item_from_database.can_have_suffix

    unless item_from_database.attack_min.nil? || item_from_database.attack_max.nil?
      base_item.computed_attack             = (item_from_database.attack_min..item_from_database.attack_max).to_a.sample
    end
    unless item_from_database.defense_min.nil? || item_from_database.defense_min.nil?
      base_item.computed_defense            = (item_from_database.defense_min..item_from_database.defense_max).to_a.sample
    end
    unless item_from_database.stealth_min.nil? || item_from_database.stealth_max.nil?
      base_item.computed_stealth            = (item_from_database.stealth_min..item_from_database.stealth_max).to_a.sample
    end
    unless item_from_database.luck_min.nil? || item_from_database.stealth_max.nil?
      base_item.computed_luck               = (item_from_database.luck_min..item_from_database.luck_max).to_a.sample
    end

    base_item.flavor_text            = item_from_database.flavor_text
    base_item.id                     = item_from_database.id.to_s.concat(base_item.computed_attack.to_s).concat(base_item.computed_defense.to_s).concat(base_item.computed_stealth.to_s).concat(base_item.computed_luck.to_s).to_i
    

    # We'll search to see if the item already exists in the master found items repository
    item_in_central_database = GameFoundItem.find_by id: base_item.id

    if item_in_central_database.nil?
      base_item.save!
    end

    return base_item
  end
end
