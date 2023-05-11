class ItemsController < ApplicationController
  def index
    @Items = Item.order("created_at DESC")
  end
end
