class Movie < ApplicationRecord
    has_many :lists_movies
    has_many :lists, through: :lists_movies
    has_many :reviews
    has_many :users, through: :reviews

    scope :sort_by_most_reviews, -> { where(reviews: self.maximum(:review))}
end
