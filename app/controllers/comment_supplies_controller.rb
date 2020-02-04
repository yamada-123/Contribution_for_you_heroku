class CommentSuppliesController < ApplicationController
  def create
    @supply = Supply.find(params[:supply_id])
    @comment_supply = @supply.comment_supplies.build(comment_supply_params)
    @comment_supply.user_id = current_user.id
    
    respond_to do |format|
      if @comment_supply.save
        format.js { render :index }
        #format.html { redirect_to supply_path(@supply) }
      else
        format.html { redirect_to supply_path(@supply), notice: '文字を一文字以上入力してください。'}
      end
    end
  end

  def edit 
    @comment_supply = CommentSupply.find(params[:id])
    @supply = Supply.find(params[:supply_id])
  end

  def update
    @comment_supply = CommentSupply.find(params[:id])
    binding.pry
    if @comment_supply.user_id == current_user.id
      @comment_supply.update(comment_supply_params)
      redirect_to supply_path(@comment_supply.supply_id), notice: "コメントを編集しました"
    else
      redirect_to supply_path(@comment_supply.supply_id),notice: "編集できませんでした"
    end
  end

  def destroy
    @comment_supply = CommentSupply.find(params[:id])
    if @comment_supply.user_id == current_user.id
       @comment_supply.destroy
       redirect_to supply_path(@comment_supply.supply_id),notice: "コメントを削除しました"
    else
       redirect_to supply_path(@comment_supply.supply_id),notice: "削除できませんでした" 
    end
  end



  private

  def comment_supply_params
    params.require(:comment_supply).permit(:supply_id, :content)
  end
end
