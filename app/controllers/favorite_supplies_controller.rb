class FavoriteSuppliesController < ApplicationController

  def create
    favorite_supply = current_user.favorite_supplies.create(supply_id: params[:supply_id])
    redirect_to supplies_url, notice: "#{favorite_supply.supply.user.name}さんのスキル投稿をお気に入り登録しました。"    
  end

  def destroy
    favorite_supply = current_user.favorite_supplies.find_by(id: params[:id]).destroy
    redirect_to supplies_url, notice: "#{favorite_supply.supply.user.name}さんのスキル投稿をお気に入り解除しました。"
  end

  def index
    @favorite_supplies_supplies = current_user.favorite_supplies_supplies
  end
end
