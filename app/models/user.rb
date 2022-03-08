class User < ApplicationRecord
  #test validations
  validates_uniqueness_of :email
  has_secure_password
end
