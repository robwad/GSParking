class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :email
      t.string :password
      t.boolean :has_space
      t.integer :points

      t.timestamps
    end
  end
end
