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

    validates :title, :genre, presence: true
    validates :year, numericality: true

    # def to_param
    #     "#{title.parameterize}"
    # end
end
