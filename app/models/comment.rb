class Comment < ApplicationRecord

  ### ASSOCIATION
  belongs_to :user
  belongs_to :micropost

  ### VALIDATION
  validates :user_id, presence: true
  validates :micropost_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }

  ### SCOPE
  default_scope -> { order(created_at: :desc) }
end
