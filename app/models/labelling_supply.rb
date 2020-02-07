class LabellingSupply < ApplicationRecord
  belongs_to :label,optional: true
  belongs_to :supply,optional: true
end
