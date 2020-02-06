class LabellingDemand < ApplicationRecord
  belongs_to :demand
  belongs_to :label
end
