class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
#  add_index is a rails method 
    add_index :users, :email, :unique=>true
  end
end
