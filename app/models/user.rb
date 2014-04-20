class User < ActiveRecord::Base
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email_address, presence: true
  validates :email_address, uniqueness: true
  validates :email_address, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }

  has_secure_password
  
end

