class Group < ApplicationRecord
  belongs_to :user
  has_many :group_movements
  has_many :movements, through: :group_movements
end
