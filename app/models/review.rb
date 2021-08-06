class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :rating, numericality: { only_integer: true, message: "No decimals please!" }

  scope :most_recently_updated, -> { order(updated_at: :desc)}
end
