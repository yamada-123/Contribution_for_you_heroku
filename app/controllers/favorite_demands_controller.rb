class FavoriteDemandsController < ApplicationController

  def create
  favorite_demand = current_user.favorite_demands.create(demand_id: params[:demand_id])
  redirect_to demands_url, notice: "#{favorite_demand.demand.user.name}さんの困りごと投稿をお気に入り登録しました。"
  end

  def destroy
    favorite_demand = current_user.favorite_demands.find_by(id: params[:id]).destroy
    redirect_to demands_url, notice: "#{favorite_demand.demand.user.name}さんの困りごと投稿をお気に入り解除しました。"
  end

  def index
    @favorite_demands_demands = current_user.favorite_demands_demands
  end

end