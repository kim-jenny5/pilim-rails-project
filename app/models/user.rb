class User < ApplicationRecord    
    has_secure_password

    has_many :lists
    has_many :reviews
    has_many :movies, through: :reviews

    validates :first_name, :last_name, :password, presence: true
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
