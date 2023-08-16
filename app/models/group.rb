class Group < ApplicationRecord
  belongs_to :user
  has_many :movements

  def total_amount
    movements.sum(:amount)
  end
end
