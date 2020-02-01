class Supply < ApplicationRecord
  validates :title,presence: true
  validates :content,presence: true
  mount_uploader :picture, ImageUploader
  #mount_uploaders:画像アップロードの宣言
  #Imageuploader:Imageuploaderファイル内の設定を元にアップロードすることを意味している。
  #pictue: suppliesテーブルのカラム名
  has_many :favorite_supplies, dependent: :destroy
  has_many :favorite_supplies_users, through: :favorite_supplies, source: :user
  belongs_to :user
end
