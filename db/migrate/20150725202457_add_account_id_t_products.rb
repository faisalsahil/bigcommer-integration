class AddAccountIdTProducts < ActiveRecord::Migration
  def change
     add_reference(:products, :account)
  end
end
