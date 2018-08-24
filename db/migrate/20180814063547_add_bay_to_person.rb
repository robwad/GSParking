class AddBayToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :bay, :integer
  end
end
