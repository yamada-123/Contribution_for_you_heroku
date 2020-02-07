class LabellingDemand < ApplicationRecord
  belongs_to :demand,optional: true
  belongs_to :label,optional: true
  #optional: trueとは、belongs_toの外部キーのnilを許可する。
end
