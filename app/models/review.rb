class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :rating, numericality: { only_integer: true }

  scope :top_ten_recently_updated, -> { order(updated_at: :desc).limit(10) }
end
