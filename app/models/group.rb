class Group < ApplicationRecord
  belongs_to :user
  has_many :movements, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :icon, presence: true

  def total_amount
    movements.sum(:amount)
  end
end
