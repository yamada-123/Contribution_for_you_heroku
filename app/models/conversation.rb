class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  #会話はUser概念をsenderとrecipientに分けた形でアソシエーションする。
  #会話の受けてと送り手がユーザーモデルから参照できるようにアソシエーションを設定する。
  #Userモデルのモデル名にxxx_idをつけただけのカラムではないため、class_nameを指定する。

  has_many :messages, dependent: :destroy
  #一つの会話はメッセージをたくさん含む一対多。
  #会話が削除されたらメッセージを削除する。

  validates_uniqueness_of :sender_id, scope: :recipient_id
  #sender_idとrecipient_idを同じ組み合わせで保存されないようにするため。

  scope :between, -> (sender_id,recipient_id) do
    #binding.pry
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND  conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end
  #SQL文かも??
  #doからendまでの記述の処理がbetweenの文字だけで起動するようになる。
  #conversations.sender_id=?は、conversations.sender_idが存在すればture,していなければfalseを返す。
  #betweenの内容は,引数に与えられたsender_idのsenderとrecipient_idのrecipientとで過去に会話が存在していたか確認するもの。

  def target_user(current_user)
    if sender_id == current_user.id
      User.find(recipient_id)
    elsif recipient_id == current_user.id
      User.find(sender_id)
    end
  end
end
