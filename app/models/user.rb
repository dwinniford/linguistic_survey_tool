class User < ActiveRecord::Base
    has_secure_password
    has_many :surveys 
    validates :name, uniqueness: true, presence: true 
    validates :password, presence: true 
end 