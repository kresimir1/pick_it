class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products
  has_many :reviews
  has_many :votes

  def admin?
    role == "admin"
  end

  def has_vote?(review)
   votes.any? { |vote| vote.review_id == review.id }
  end

  def vote_type(review)
    find_vote_for_review(review).count
  end

  def find_vote_for_review(review)
    votes.detect { |vote| vote.review_id == review.id }
  end


end
