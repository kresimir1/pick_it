class Vote < ApplicationRecord
  validates :count, presence: true,  numericality: { only_integer: true }

  belongs_to :review
  belongs_to :user



end
