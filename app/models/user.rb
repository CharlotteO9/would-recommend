class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memberships, dependent: :destroy
  has_many :communities, dependent: :destroy
  has_many :recommendations, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :communities, through: :memberships

  validates :username, presence: true
  validates :password, length: { minimum: 7 }
  validates :username, uniqueness: true { scope: :password }
end
