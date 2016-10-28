class Review < ApplicationRecord
  validates :content, presence: true
  validates :username, presence: true
  validates :title, presence: true

  belongs_to :product
  belongs_to :user
end
