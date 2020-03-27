class Like < ApplicationRecord

  ### ASSOCIATION
  belongs_to :user
  belongs_to :micropost

  ### VALIDATION
  validates :user_id, presence: true
  validates :micropost_id, presence: true
end
