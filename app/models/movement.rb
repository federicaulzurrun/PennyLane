class Movement < ApplicationRecord
  belongs_to :user
  has_many :group_movements
  has_many :groups, through: :group_movements
end
