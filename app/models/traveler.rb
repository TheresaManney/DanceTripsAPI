require 'bcrypt'
# require 'knock'

class Traveler < ApplicationRecord
  # has_secure_password is an authenticate method that can be used because of the bcrypt gem and the require at the top of this model
  has_secure_password

  has_many :trips


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.from_token_payload(payload)
    self.find payload["sub"]
  end
end
