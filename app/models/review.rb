class Review < ApplicationRecord
  validates :content, presence: true
  validates :username, presence: true
  validates :title, presence: true

  belongs_to :product
  belongs_to :user
  has_many :votes, dependent: :destroy

  def vote_total
    total = 0
    votes.each do |vote|
      total += vote.count
    end
    total
  end

end
