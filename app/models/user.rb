class User < ApplicationRecord
  before_validation { email.downcase! }#emailカラムデーターのアルファベットが大文字の時小文字に変更する。
  validates :name,presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true #同じemailの登録を禁止する記述

  validates :email,presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable

 has_many :demands,dependent: :destroy #ユーザーを削除したら投稿したdemands内容も一緒に削除される。
 has_many :favorite_demands, dependent: :destroy #ユーザーを削除したらユーザーのお気に入り情報も削除される。
 has_many :favorite_supplies, dependent: :destroy
 has_many :favorite_demands_demands, through: :favorite_demands, source: :demand
 has_many :favorite_supplies_supplies, through: :favorite_supplies, source: :supply

 mount_uploader :picture, ImageUploader
end

#上左から、ログイン時のパスワードを暗号化してデータベースに保存する機能。
#サインアップ処理(アカウントの編集と削除も可能)

#パスワードリセット機能
#cookieにユーザー情報を記録させる
#メールアドレスとパスワードのバリデーションを提供する。
#メールアドレス認証