class Like < ApplicationRecord

  ### ASSOCIATION
  belongs_to :user
  belongs_to :item

  ### VALIDATION
  validates :user_id, presence: true
  validates :item_id, presence: true
end
