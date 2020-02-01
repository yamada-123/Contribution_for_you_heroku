class SuppliesController < ApplicationController
  before_action :set_supply, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! #ログインユーザーのみアクセス許可
  def index
    @supplies = Supply.all
  end

  def new
    @supply = Supply.new
  end

  def create
    @supply = Supply.new(supply_params)
    @supply.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @supply.save
    #Supply.create(params[:supply])
    #Supply.create(title: params[:supply][:title],content: params[:supply][:content],picture: params[:supply][:picture])
        redirect_to new_supply_path, notice: 'スキルを投稿しました。'
      else
        render :new
      end
    end
  end

  def show
    @favorite_supply = current_user.favorite_supplies.find_by(supply_id: @supply.id)
    #binding.pry
    # @supply = Supply.find(params[:id])
  end

  def edit
    # @supply = Supply.find(params[:id])
  end

  def update
    # @supply = Supply.find(params[:id])
    if @supply.update(supply_params)
      redirect_to supplies_path, notice: "スキル投稿を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @supply.destroy
    redirect_to supplies_path, notice:"スキル投稿を削除しました"
  end

  def confirm
    @supply = Supply.new(supply_params)
    render :new if @supply.invalid?
  end

  private

  def supply_params
    params.require(:supply).permit(:title,:content,:picture, :picture_cache)
    #picture_cacheは、確認画面の実装を挟む時に必要
  end

  def set_supply
    @supply = Supply.find(params[:id])
  end
end
