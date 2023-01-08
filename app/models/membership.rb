class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_many :communities
  has_many :users, through: :membership

  validates :name, presence: true
end
