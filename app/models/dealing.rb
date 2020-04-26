class Dealing < ApplicationRecord
  ### ASSOCIATION
  belongs_to :user
  belongs_to :item

  ### VALIDATION
  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :status, presence: true

  enum status: {
      payed: 1,
      delivering: 2,
      completed: 3
  }

end
