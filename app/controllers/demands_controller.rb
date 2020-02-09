class DemandsController < ApplicationController
  before_action :set_demand, only: [:show,:edit,:update,:destroy]
  before_action :authenticate_user! #ログインユーザーのみdemands掲示板にアクセス許可
  PER = 3
  def index
    @demands = Demand.page(params[:page]).per(PER)
    #@demands = Demand.all
    #@demands = current_user.demands 自分の投稿しか見れないようにする記述
  end

  def new
    @demand = Demand.new #ビューにインスタンス変数を引き渡す。
  end

  def create
    @demand = Demand.new(demand_params)
    @demand.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @demand.save
      redirect_to demands_path, notice: "困り事を投稿しました!"
      else
      render :new
      end
    end
    #(title: params[:demand][:title], content: params[:demand][:content], picture: params[:demand][:picture],region: params[:demand][:region])
    #(params[:demand])
  end

  def show
    #@demand = Demand.find(params[:id])
    @favorite_demand = current_user.favorite_demands.find_by(demand_id: @demand.id)
    #favorite_demandsテーブルからログイン中のユーザーがお気に入り登録している全てのレコードを抽出
    @comment_demands = @demand.comment_demands
    @comment_demand = @demand.comment_demands.build
    #binding.pry
    
  end

  def edit
    #binding.pry
    #@demand = Demand.find(params[:id])
    if @demand.user_id != current_user.id
      redirect_to demands_path, notice: "他人の投稿は編集できません。"
    end
  end

  def update
    #@demand = Demand.find(params[:id])
    #binding.pry
    if @demand.update(demand_params)
      redirect_to demands_path, notice: "困り事を編集しました!"
    else
      render :edit
    end
  end

  def destroy
    #@demand = Demand.find(params[:id])
    @demand.destroy
    redirect_to demands_path, notice:"困り事を削除しました!"
  end

  def confirm
    #@demand = Demand.new(demand_params)
    @demand = Demand.new(demand_params)
    @demand.user_id = current_user.id
    render :new if @demand.invalid?
  end

  
  private
    
  def demand_params
    params.require(:demand).permit(:title,:content,:picture, :picture_cache, label_ids: [] )
    #画像データそのものを取り扱うパラメータ
  end

  def set_demand
    @demand = Demand.find(params[:id])
  end
end

# class A 
#   label_ids = "a"
# end

# new A(label_ids: 'a')

# class User
#   has_many :products, source: :product, as: :products, foreign_key: :user_id
# end

# class Product
#   belongs_to :user
# end

# @user.products

