class User < ApplicationRecord
  has_many :movements
  has_many :groups
end