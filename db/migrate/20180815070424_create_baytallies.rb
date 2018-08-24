class CreateBaytallies < ActiveRecord::Migration[5.2]
  def change
    create_table :baytallies do |t|
      t.integer :bay_number
      t.integer :tally

      t.timestamps
    end
  end
end
