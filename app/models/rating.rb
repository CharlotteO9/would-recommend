class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :recommendation

  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 6 }
end
