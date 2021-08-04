class User < ApplicationRecord    
    has_secure_password

    has_many :lists
    has_many :reviews
    has_many :movies, through: :reviews

    validates :first_name, :last_name, :password, presence: { message: "This field must be provided."}
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
