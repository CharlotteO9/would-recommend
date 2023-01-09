class Community < ApplicationRecord
  belongs_to :user
  has_many :recommendations, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  validates :name, presence: true
end
