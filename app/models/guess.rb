class Guess < ActiveRecord::Base
  validates :answer_input, presence: true
  
  belongs_to :round
  belongs_to :card

  attr_accessible :answer_input, :round_id, :card_id, :correctness
end
