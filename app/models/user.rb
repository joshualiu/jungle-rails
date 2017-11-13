class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :firstName, :lastName, :email
 
  validates_uniqueness_of :email, :case_sensitive => false

  validates :password, length: { minimum: 6 }
  
end
