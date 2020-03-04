class Location < ActiveRecord::Base 
    has_many :surveys 
    validates :province, :county, :village, presence: true, format: { with: /[a-z]/, message: "only allows letters"}

    
    def complete_name
        "#{province}, #{county}, #{village}"
    end
end 