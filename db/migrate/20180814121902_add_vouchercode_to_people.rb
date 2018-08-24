class AddVouchercodeToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :voucher_code, :string
  end
end
