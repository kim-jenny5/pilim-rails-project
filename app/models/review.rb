class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  scope :most_recently_updated, -> { order(updated_at: :desc)}
end
