class AddCustomerIdToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :customer_id, :int
  end
end
