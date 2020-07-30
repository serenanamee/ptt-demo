class Board < ApplicationRecord

  acts_as_paranoid  

  has_many :posts, foreign_key: 'board_id'(#不寫是慣例（coc))
  validates :title, presence: true


end
