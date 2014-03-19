class Users < ActiveRecord::Migration
  def change
      create_table :users do |t|
          t.string :username
          t.string :email_address
          t.string :password_digest
          t.string :shipping_address1
          t.string :shipping_address2
          t.string :shipping_city
          t.string :shipping_state
          t.string :shipping_zip
          t.string :phone_number
      end
  end
end
