class Dealing < ApplicationRecord
  include DealingsHelper

  ### ASSOCIATION
  belongs_to :seller, class_name: "User"
  belongs_to :buyer,  class_name: "User"
  belongs_to :item
  has_many :reviews, dependent: :destroy

  ### VALIDATION
  validates :item_id, presence: true
  validates :buyer_id, presence: true
  validates :seller_id, presence: true
  validates :status, presence: true

  enum status: {
      payed: 1,
      delivering: 2,
      completed: 3
  }

  ### FUNCTION
  def seller?(user)
    self.seller == user
  end

  def buyer?(user)
    self.buyer == user
  end

  def accessible_user?(user)
    self.seller?(user) || self.buyer?(user)
  end

  def already_reviewed?(user)
    review = Review.find_by(dealing_id: self.id, reviewer_id: user.id)
    review.blank?
  end

end
