class Supply < ApplicationRecord
  validates :title,presence: true
  validates :title, length: { maximum:50}
  validates :content,presence: true
  validates :content, length: { maximum:200}
  mount_uploader :picture, ImageUploader
  #mount_uploaders:画像アップロードの宣言
  #Imageuploader:Imageuploaderファイル内の設定を元にアップロードすることを意味している。
  #pictue: suppliesテーブルのカラム名
  has_many :favorite_supplies, dependent: :destroy
  has_many :favorite_supplies_users, through: :favorite_supplies, source: :user
  belongs_to :user
  has_many :comment_supplies, dependent: :destroy

  has_many :labelling_supplies, dependent: :destroy, foreign_key: 'supply_id'
  #supplyテーブル : labelling_suppliesテーブル = 1 :多
  has_many :labels, through: :labelling_supplies, source: :label
  #ただのメソッド、supplyテーブルは中間テーブルを通してlabel情報を取得する。
end
