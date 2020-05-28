class Review < ApplicationRecord
  belongs_to :dealing
  belongs_to :reviewed, class_name: "User"
  belongs_to :reviewer,  class_name: "User"

  enum evaluation: {
      good:1, ok:2, bad:3
  }
end
