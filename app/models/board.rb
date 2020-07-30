class Board < ApplicationRecord

  acts_as_paranoid  

  has_many :posts
  validates :title, presence: true


end
