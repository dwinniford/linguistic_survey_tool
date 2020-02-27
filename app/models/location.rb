class Location < ActiveRecord::Base 
    has_many :surveys 
end 