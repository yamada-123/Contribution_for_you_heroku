class LabellingSupply < ApplicationRecord
  belongs_to :label
  belongs_to :supply
end
