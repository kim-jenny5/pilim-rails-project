class User < ApplicationRecord    
    has_secure_password
    
    has_many :lists
    has_many :reviews
    has_many :movies, through: :reviews
end
