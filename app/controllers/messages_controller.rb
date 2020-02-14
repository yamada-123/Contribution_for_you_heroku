class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
    #binding.pry
    #どのチャットルームでなされているメッセージなのか?を取得する
  end

  def index
    @messages = @conversation.messages # order
    #会話に紐づくメッセージを全て取得する。
    # (modelに切り出す)
    # @messages.change_order
    # render :index
    # @over_ten = over? ? true : false @over_tenに事前に何か文字を入れる。
    #@over_tenは、
    # if @messages.length > 10
    #   @over_ten = true
    #   @messages = Message.where(id: @messages[-10..-1].pluck(:id))
    #   #メッセージの数が10より多ければ、メッセージの最新の10件取得する
    # end

    # 必ずしもparamsをつかう必要ある？あるならbooleanだと分かるようにunder_ten_messages? などにするべき
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    # なぜlastなのか意図がわからないので、未読が関連するならそれを盛り込むべき
    # @messages.include_unread?などにすべき 一行なら後置ifで良い
    if @messages.last
      @messages.where.not(user_id: current_user.id).update_all(read: true)
      #もし最新のメッセージが1件以上存在し、かつそのメッセージがログインユーザーのものでなければ、今映っているメッセージを全て既読にする。
      #mark as readのメソッドをモデルに定義してあげる。
      # @messages.mark_as_read if @messages.last.unread?
    end
  

    @messages = @messages.order(:created_at)
    #表示されたメッセージを投稿順に並び替える。
    @message = @conversation.messages.build
    #新規投稿のメッセージ用の変数を作成する。
  end

  def create
    @message = @conversation.messages.build(message_params)
      #paramsを利用して会話にひもづくメッセージを生成する
    if @message.save
      #binding.pry
      redirect_to conversation_messages_path(@conversation)
      #保存されたら、会話にひもづくチャットルームに遷移する
    else
      render 'index'
    end
  end



  def destroy
    #binding.pry
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to conversation_messages_path, notice:"メッセージを削除しました!"
  end
  
  private

  def message_params
    params.require(:message).permit(:body,:user_id)
  end

end
