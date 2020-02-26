class User < ApplicationRecord
  before_validation { email.downcase! }#emailカラムデーターのアルファベットが大文字の時小文字に変更する。
  validates :name,presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true #同じemailの登録を禁止する記述
  validates :password, length: {maximum:30}
  validates :email,presence: true
  validates :introduction,length: {maximum: 300}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,:confirmable

 has_many :messages,dependent: :destroy
 has_many :supplies,dependent: :destroy
 has_many :demands,dependent: :destroy #ユーザーを削除したら投稿したdemands内容も一緒に削除される。
 has_many :favorite_demands, dependent: :destroy #ユーザーを削除したらユーザーのお気に入り情報も削除される。
 has_many :favorite_supplies, dependent: :destroy
 has_many :favorite_demands_demands, through: :favorite_demands, source: :demand
 has_many :favorite_supplies_supplies, through: :favorite_supplies, source: :supply
 has_many :comment_supplies,dependent: :destroy
 has_many :comment_demands,dependent: :destroy

 mount_uploader :picture, ImageUploader
 
 def update_without_password(params, *options)
  #binding.pry
  params.delete(:current_password) 
  #params.delete(:current_password) で current_password のパラメータを削除。
  #binding.pry
  if params[:password].blank? && params[:password_confirmation].blank? 
    #パスワード変更のためのパスワード入力フィールドとその確認フィールドの両者とも空の場合のみ、パスワードなしで更新できるようにするためです。

    params.delete(:password)
    params.delete(:password_confirmation)
  end

  result = update_attributes(params, *options)
  clean_up_passwords
  result
end
end

#上左から、ログイン時のパスワードを暗号化してデータベースに保存する機能。
#サインアップ処理(アカウントの編集と削除も可能)

#パスワードリセット機能
#cookieにユーザー情報を記録させる
#メールアドレスとパスワードのバリデーションを提供する。
#メールアドレス認証