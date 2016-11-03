class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true

  belongs_to :user
  has_many :reviews, dependent: :destroy

  def self.search(search)
    where("name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
  end


end
