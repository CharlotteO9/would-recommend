class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :recommendation

  validates :score, presence: true
end
