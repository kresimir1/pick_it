class Vote < ApplicationRecord

  belongs_to :review
  belongs_to :user

  validates :count, presence: true,  numericality: { only_integer: true }
  validates :count, inclusion: { in: -1..1 }
  validates :user_id, uniqueness: { scope: :review_id }

end
