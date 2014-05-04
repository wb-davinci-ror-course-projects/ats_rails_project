class Users < ActiveRecord::Migration
  def change
      create_table :users do |t|
          t.string :username
          t.string :first_name
          t.string :last_name
          t.string :company_name
          t.string :phone_number
          t.string :email_address
          t.string :password_digest
          t.string :shipping_first_name
          t.string :shipping_last_name
          t.string :shipping_address1
          t.string :shipping_address2
          t.string :shipping_city
          t.string :shipping_state
          t.string :shipping_zip
          t.string :shipping_phone_number
          t.string :billing_first_name
          t.string :billing_last_name
          t.string :billing_address1
          t.string :billing_address2
          t.string :billing_city
          t.string :billing_state
          t.string :billing_zip
          t.string :billing_phone_number
          t.string :credit_first_name
          t.string :credit_last_name
          t.integer :credit_month
          t.integer :credit_year
          t.integer :credit_security_code
          t.timestamp
      end
  end
end
