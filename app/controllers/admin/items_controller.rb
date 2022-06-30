class Admin::ItemsController < ApplicationController
   before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]

  def new
      @item = Item.new
  end

  def index
    @items = Item.all
     @item =Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      flash[:genre_created_error] = "ジャンル名を入力してください"
    redirect_to
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_(@item)
      flash[:notice_update] = "ジャンル情報を更新しました！"
    else
      redirect_to edit_admins_items_path(@item)
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def edit
    @item = Item.find(params[:id])
  end
end
private

  def item_params
    params.permit(:genre_id, :name, :introduction, :price, :is_active, :image)

  end
