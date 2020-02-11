class SuppliesController < ApplicationController
  before_action :set_supply, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! #ログインユーザーのみアクセス許可
  PER = 2
  def index
    # @supplies = Supply.page(params[:page]).per(PER)

    @search = Supply.ransack(params[:q])
    # params[q]には検索パラメーターが渡されるため、@searchという検索オブジェクトが作成される。
    @supplies = @search.result(distinct: true).page(params[:page]).per(PER)
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
        # binding.pry
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
    @comment_supplies = @supply.comment_supplies
    @comment_supply = @supply.comment_supplies.build
    #binding.pry
    # @supply = Supply.find(params[:id])
  end

  def edit
    # @supply = Supply.find(params[:id])
    if @supply.user_id != current_user.id
      redirect_to supplies_path, notice: "他人の投稿は編集できません。"
    end
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
    @supply.user_id = current_user.id
    render :new if @supply.invalid?
  end

  private

  def supply_params
    params.require(:supply).permit(:title,:content,:picture, :picture_cache, label_ids: [])
    #picture_cacheは、確認画面の実装を挟む時に必要
  end

  def set_supply
    @supply = Supply.find(params[:id])
  end
end
