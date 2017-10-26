class Tour < ApplicationRecord
  has_many :reviews
  belongs_to :user
  ratyrate_rateable "details", "coolness" 
end
