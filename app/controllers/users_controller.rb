class UsersController < ApplicationController
  def index
    #@users = User.all
    @search = User.ransack(params[:q])
    # binding.pry
    # params[q]には検索パラメーターが渡されるため、@searchという検索オブジェクトが作成される。
    @users = @search.result(distinct: true)
    
    # 検索結果が得られる記述
  end
  
  def show
    @user = User.find(params[:id])
    #binding.pry
  end  
end