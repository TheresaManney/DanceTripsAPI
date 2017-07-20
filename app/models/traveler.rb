require 'bcrypt'
# require 'knock'

class Traveler < ApplicationRecord
  # has_secure_password is an authenticate method that can be used because of the bcrypt gem and the require at the top of this model
  has_secure_password #:validations => false
  has_many :trips

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  # validates :password, presence: true, :on => :create
  validates :password, presence: true, length: { minimum: 6 }, :on => :create
  validates :password_confirmation, presence: true, :on => :create
  # validates :password_digest, presence: true



  def self.to_token_payload
    {
      sub: id,
      email: email
    }
  end
end
