class User < ApplicationRecord    
    has_secure_password

    has_many :lists
    has_many :reviews
    has_many :movies, through: :reviews

    validates :first_name, :last_name, presence: true
    validates :username, presence: true, uniqueness: { message: "is already taken" }, format: { without: /\W/, message: "Only letters, numbers, and underscores allowed. Symbols are not permitted."}
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ }, presence: true, uniqueness: { message: "is already taken" }
end
