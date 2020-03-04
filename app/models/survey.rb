class Survey < ActiveRecord::Base 
    belongs_to :user 
    belongs_to :location 
    validates :name, :gender, :age, :first_language, :second_language, presence: true 
end 
