class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :community

  validates :status, inclusion: { in: %w[accepted rejected pending] }
end
