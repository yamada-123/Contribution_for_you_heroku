class UsersController < ApplicationController
  PER = 5
  def index
    #@users = User.all
    @search = User.ransack(params[:q])
    # binding.pry
    # params[q]には検索パラメーターが渡されるため、@searchという検索オブジェクトが作成される。
    #@users = @search.result(distinct: true).page(params[:page]).per(PER)
    @users = @search.result.page(params[:page]).per(PER)
    #distinct:trueが原因で入れ替えがバラバラになってしまう。
    
    # 検索結果が得られる記述
  end
  
  def show
    @user = User.find(params[:id])
    #binding.pry
  end  
end
