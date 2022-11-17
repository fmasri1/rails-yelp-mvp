class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :address, :category, presence: true
  CATEGORIES = %w[chinese italian french japanese belgian]
  validates :category, inclusion: { in: CATEGORIES }
end
