class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_many :ratings, dependent: :destroy

  validates :category, inclusion: { in: %w[restaurant watch read podcast health shop trip] }
  validates :title, presence: true
end
