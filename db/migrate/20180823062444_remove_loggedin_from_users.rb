class RemoveLoggedinFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :loggedin, :boolean
  end
end
