class FavoriteDemand < ApplicationRecord
  belongs_to :user
  belongs_to :demand
end
