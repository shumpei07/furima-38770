class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new,:edit]
  before_action :@item = Item.find(params[:id]), only:[:show, :edit, :update]

   def index
    @items = Item.order("created_at DESC")
   end

   def new
     @item = Item.new
   end

   def create
     @item = Item.new(item_params)
     if @item.save
       redirect_to root_path
     else
       render :new
     end
   end

   def show
   end

   def edit
    unless @item.user == current_user
      redirect_to root_path
    end
   end

   def update
    if@item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
   end



   private
   def item_params
     params.require(:item).permit(:name,:introduction, :category_id, :item_condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price, :image).merge(user_id: current_user.id)
   end
  
   def @item = Item.find(params[:id])
   end
end 
