class Movie < ApplicationRecord
    has_many :lists_movies
    has_many :lists, through: :lists_movies
    has_many :reviews
    has_many :users, through: :reviews

    #DOESN'T WORK. WILL NEED TO FIGURE IT OUT
    # scope :sort_by_most_reviews, -> { where(reviews: self.maximum(:review))}
    # scope :sort_by_most_reviews, -> { joins(:reviews).group(:title).order(reviews: :desc)}
    # scope :sort_by_most_reviews, -> { includes(:reviews).order(reviews: :desc)}
    scope :newest_releases, -> {order(year: :desc)}
    scope :alphabetical_genre, -> {order(:genre)}
end
