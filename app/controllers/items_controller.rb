class ItemsController < ApplicationController

  def item_crank

    @item = generate_item()  # Gets the item from the database.
    render :json => @item, :status => :ok
  end

  def generate_item()
    # TODO Generate item by player level and luck. Generate formula to do this.
    
    base_item = Item.offset(rand(Item.count)).first
    return base_item
  end
end
