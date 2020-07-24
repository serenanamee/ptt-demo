class Board < ApplicationRecord

  validates :title, presence: true, length: {minimum: 2}

  def destroy
    update(delete_at: time.now)
  end
end
