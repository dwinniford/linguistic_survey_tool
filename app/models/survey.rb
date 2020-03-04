class Survey < ActiveRecord::Base 
    belongs_to :user 
    belongs_to :location 
    validates :name, :gender, :age, :first_language, :second_language, presence: true 
    validates :name, :first_language, :second_language, format: { with: /\A[ a-zA-Z]+\z/, message: "only allows letters and spaces"}
    validates :age, numericality: { only_integer: true, greater_than: 0, less_than: 115 }
    validates_associated :location
end 
