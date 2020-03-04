class Survey < ActiveRecord::Base 
    belongs_to :user 
    belongs_to :location 
    validates :name, :gender, :age, :first_language, :second_language, presence: true 
    validates :name, :first_language, :second_language, format: { with: /[ a-z]/, message: "only allows letters and spaces"}
    validates_associated :location
end 
