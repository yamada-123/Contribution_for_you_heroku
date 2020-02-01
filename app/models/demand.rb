class Demand < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  mount_uploader :picture, ImageUploader
  #mount_uploaderは、画像アップロードの宣言
  #ImageUploaderは、ファイル内の設定を元にアップロードすることを意味している。
  belongs_to :user
  has_many :favorite_demands, dependent: :destroy #demand投稿を削除したら、demandのお気に入り情報も削除される。
  has_many :favorite_demand_users, through: :favorite_demands, source: :user #favorite_demandsテーブル情報を通してユーザー情報を取得する。
end
