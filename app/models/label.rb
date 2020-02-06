class Label < ApplicationRecord
  has_many :labelling_demands, dependent: :destroy, foreign_key: 'label_id'
  #label : labelling_demands = 1 : 多
  has_many :demands, through: :labelling_demands, source: :demand
  #ただのメソッド名,labelは中間テーブルを通してdemand情報を取得
  has_many :labelling_supplies, dependent: :destroy, foreign_key: 'label_id'
  #label : labelling_supplies = 1 : 多
  has_many :supplies, through: :labelling_supplies,source: :supply
  #ただのメソッド名、labelは中間テーブルを通してsupply情報を取得する。
end
