class Demand < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  mount_uploader :picture, ImageUploader
  #mount_uploaderは、画像アップロードの宣言
  #ImageUploaderは、ファイル内の設定を元にアップロードすることを意味している。
end
