class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, :format => { :with => /\w+@\w+\.\w{2,}/, :message => "invalid email" }, :uniqueness => true
  
  has_many :rounds

  attr_accessible :name, :email, :password
end
