class AddDateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :date, :Date
  end
end
