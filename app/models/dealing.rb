class Dealing < ApplicationRecord
  ### ASSOCIATION
  belongs_to :seller, class_name: "User"
  belongs_to :buyer,  class_name: "User"
  belongs_to :item

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

end
