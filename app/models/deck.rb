class Deck < ActiveRecord::Base
  attr_accessible :category 
  validates :category, presence: true

  has_many :cards
  has_many :rounds
end
