class List < ApplicationRecord
  belongs_to :user
  has_many :lists_movies
  has_many :movies, through: :lists_movies

  validates :title, presence: true
end
