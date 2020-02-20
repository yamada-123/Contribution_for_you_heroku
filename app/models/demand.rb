class Demand < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum:50 }
  validates :content, presence: true
  validates :content, length: { maximum:200}
  # mount_uploader :picture, PictureUploader
  mount_uploader :picture, ImageUploader
  #mount_uploaderは、画像アップロードの宣言
  #ImageUploaderは、ファイル内の設定を元にアップロードすることを意味している。
  belongs_to :user 
  #demandsテーブル:userテーブル = 1:多
  has_many :favorite_demands, dependent: :destroy 
  #favorite_demandsテーブル:demandテーブル = 1:多 demand投稿を削除したら、demandのお気に入り情報も削除される。
  has_many :favorite_demand_users, through: :favorite_demands, source: :user 
  #favorite_demandsテーブル情報を通してユーザー情報を取得する。そのため、favorite_demand_usersテーブルは存在しないのである。
  has_many :comment_demands, dependent: :destroy   
  #comment_demandsテーブル:demandテーブル=1:多
  has_many :labelling_demands, dependent: :destroy, foreign_key: 'demand_id'
  #labelling_demandsテーブル:demandテーブル= 1:多
  has_many :labels, through: :labelling_demands, source: :label
  #ただのメソッド名,userから中間テーブルを通して、label情報を取得する。
end
