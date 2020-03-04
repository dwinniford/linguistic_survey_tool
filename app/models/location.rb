class Location < ActiveRecord::Base 
    has_many :surveys 
    validates :province, :county, :village, presence: true 
    
    def complete_name
        "#{province}, #{county}, #{village}"
    end
end 