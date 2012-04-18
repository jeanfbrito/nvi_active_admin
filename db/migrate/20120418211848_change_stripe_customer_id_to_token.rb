class ChangeStripeCustomerIdToToken < ActiveRecord::Migration
  def change
    remove_column :users, :stripe_customer_id
    add_column :users, :stripe_customer_token, :string
  end
end
