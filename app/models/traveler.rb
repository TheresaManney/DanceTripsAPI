class Traveler < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
