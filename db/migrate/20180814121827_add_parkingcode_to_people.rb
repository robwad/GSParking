class AddParkingcodeToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :parking_code, :string
  end
end
