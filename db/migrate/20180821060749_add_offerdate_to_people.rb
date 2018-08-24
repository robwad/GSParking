class AddOfferdateToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :offer_date, :string
    add_column :people, :date, :string
  end
end
