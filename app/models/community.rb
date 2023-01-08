class Community < ApplicationRecord
  has_many :recommendations, dependent: :destroy
  validates :status, inclusion: { in: %w[accepted rejected pendind] }
end
