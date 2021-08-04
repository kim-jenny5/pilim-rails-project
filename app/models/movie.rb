class Movie < ApplicationRecord
    has_many :lists_movies
    has_many :lists, through: :lists_movies
    has_many :reviews
    has_many :users, through: :reviews
end
