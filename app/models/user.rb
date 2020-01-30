class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
end

#上左から、ログイン時のパスワードを暗号化してデータベースに保存する機能。
#サインアップ処理(アカウントの編集と削除も可能)
#パスワードリセット機能
#cookieにユーザー情報を記録させる
#メールアドレスとパスワードのバリデーションを提供する。
#メールアドレス認証