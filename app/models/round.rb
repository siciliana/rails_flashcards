class Round < ActiveRecord::Base
  validates :correct_guess_count, presence: true 

  belongs_to :user
  belongs_to :deck
  has_many :guesses

  attr_accessible :correct_guess_count, :user_id, :deck_id
end
