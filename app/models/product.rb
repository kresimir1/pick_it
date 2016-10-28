class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true

  belongs_to :user
  has_many :reviews, dependent: :destroy
end
