class List < ApplicationRecord
  belongs_to :user
  has_many :lists_movies, dependent: :destroy
  has_many :movies, through: :lists_movies

  validates :title, presence: true

  scope :list_search, -> (term) { joins(:lists_movies).joins(:movies).where("lists.title LIKE :term OR movies.title LIKE :term", term: "%#{term}%").distinct }
end
