class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :reservations
  has_many :restaurants, through: :reservations


end
