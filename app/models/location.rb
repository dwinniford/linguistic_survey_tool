class Location < ActiveRecord::Base 
    has_many :surveys 
    def complete_name
        "#{province}, #{county}, #{village}"
    end
end 