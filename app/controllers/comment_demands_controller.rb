class CommentDemandsController < ApplicationController
  def create
    @demand = Demand.find(params[:demand_id])
    @comment_demand = @demand.comment_demands.build(comment_demand_params)
    @comment_demand.user_id = current_user.id
    #クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment_demand.save
        format.js { render :index } #index.js.erbに飛ぶ
        #format.html { redirect_to demand_path(@demand)}
      else
        format.html { redirect_to demand_path(@demand), notice: '一文字以上入力してください。'}
      end
    end
  end

    def edit
      @comment_demand = CommentDemand.find(params[:id])
      @demand = Demand.find(params[:demand_id])
    end

    def update
      @comment_demand = CommentDemand.find(params[:id])
      if @comment_demand.user_id == current_user.id
      @comment_demand.update(comment_demand_params)
        redirect_to demand_path(@comment_demand.demand_id), notice: "コメントを編集しました"
      else
        redirect_to demand_path(@comment_demand.demand_id), notice: "編集できませんでした"
      end
    end

    def destroy
      @comment_demand = CommentDemand.find(params[:id])
      if @comment_demand.user_id == current_user.id
      @comment_demand.destroy
      redirect_to demand_path(@comment_demand.demand_id),notice: "コメントを削除しました"
      else
        redirect_to demand_path(@comment_demand.demand_id),notice: "削除できませんでした"
      end
    end


  private

  def comment_demand_params
    params.require(:comment_demand).permit(:demand_id, :content)
  end
end
