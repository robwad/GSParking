class AddBaycodeToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :baycode, :integer
  end
end
