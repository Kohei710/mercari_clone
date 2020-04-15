class Transaction < ApplicationRecord

  ### ASSOCIATION
  belongs_to :user
  belongs_to :item

  ### VALIDATION
  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :delivery_status, presence: true

  enum delivery_status: {
      支払い待ち:1, 送付待ち:2, 到着待ち:3
  }

end
