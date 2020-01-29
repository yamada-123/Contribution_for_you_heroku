class DemandsController < ApplicationController
  before_action :set_demand, only: [:show,:edit,:update,:destroy]

  def index
    @demands = Demand.all
  end

  def new
    @demand = Demand.new #ビューにインスタンス変数を引き渡す。
  end

  def create
    @demand = Demand.new(demand_params)
    if params[:back]
      render :new
    else
      if @demand.save
      redirect_to demands_path, notice: "悩み事投稿しました!"
      else
      render :new
      end
    end
    #(title: params[:demand][:title], content: params[:demand][:content], picture: params[:demand][:picture],region: params[:demand][:region])
    #(params[:demand])
    #binding.irb
  end

  def show
    #binding.irb
    #@demand = Demand.find(params[:id])
  end

  def edit
    #binding.pry
    #@demand = Demand.find(params[:id])
  end

  def update
    #@demand = Demand.find(params[:id])
    #binding.pry
    if @demand.update(demand_params)
      redirect_to demands_path, notice: "悩み事を編集しました!"
    else
      render :edit
    end
  end

  def destroy
    #@demand = Demand.find(params[:id])
    @demand.destroy
    redirect_to demands_path, notice:"悩み事を削除しました!"
  end

  def confirm
    #binding.pry
    @demand = Demand.new(demand_params)
    render :new if @demand.invalid?
  end

  
  private
    
  def demand_params
    params.require(:demand).permit(:title,:content,:picture, :picture_cache)
    #画像データそのものを取り扱うパラメーター
  end

  def set_demand
    @demand = Demand.find(params[:id])
  end
end
