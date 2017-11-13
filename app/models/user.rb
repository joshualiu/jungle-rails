class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :firstName, :lastName, :email
 
  validates_uniqueness_of :email, :case_sensitive => false

  validates :password, length: { minimum: 6 }
  
  validates :email, format: {with: /\w+@[a-zA-Z]+\.[a-zA-Z]{2,3}/}

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)

    if user && user.authenticate(password)
      true
    else 
      false
    end

  end
  
end
