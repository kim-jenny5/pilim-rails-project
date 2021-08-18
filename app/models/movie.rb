class Movie < ApplicationRecord
    has_many :lists_movies
    has_many :lists, through: :lists_movies
    has_many :reviews
    has_many :users, through: :reviews

    scope :newest_releases, -> { order(year: :desc) }
    scope :alphabetical_genre, -> { order(:genre) }
    scope :distinct_alphabetized_genre, -> { order(:genre).select(:genre).distinct }
    scope :movie_search, -> (term) { where('title LIKE ?', "%#{term}%") }
    scope :filtered_by_genre, -> (genre) { where(genre: genre) }
    scope :most_reviews, -> { joins(:reviews).group(:movie_id).order("count(reviews.id) desc") }

    #get the movies with most reviews

    validates :title, :genre, presence: true
    validates :year, numericality: true

    extend FriendlyId
    friendly_id :title, use: :slugged
end
