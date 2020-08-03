class AddUserToBoard < ActiveRecord::Migration[6.0]
  def change
    add_reference :boards, :user, null: true, foreign_key: true
  end
end
