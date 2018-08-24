class AddBayToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bay, :integer
  end
end
