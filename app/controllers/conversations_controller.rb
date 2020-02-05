class ConversationsController < ApplicationController

  def index
    @conversations = Conversation.all
    #binding.pry
  end

  def create
    if user_signed_in?

  # scope :between, -> (sender_id,recipient_id) do
  #   where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND  conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  # end
  # #doからendまでの記述の処理がbetweenの文字だけで起動するようになる。
  # #conversations.sender_id=?は、conversation.sender_idが存在すればture,していなければfalseを返す。
  # #betweenの内容は,引数に与えられたsender_idのsenderとrecipient_idのrecipientとで過去に会話が存在していたか確認するもの。
      if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      #該当ユーザー間での会話が過去に存在しているかの記述
      #binding.pry
        @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
      else
        @conversation = Conversation.create!(conversation_params)
      #該当ユーザー間での会話が過去に存在していないなら、チャットルームを作成する。
      end
    redirect_to conversation_messages_path(@conversation)
    #binding.pry
    #メッセージの一覧画面に遷移する。
    else
      redirect_to root_path
    end
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

end
