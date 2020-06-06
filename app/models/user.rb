require 'bcrypt'
class User < ApplicationRecord
  has_one :subject
  has_secure_password
 
  validates_presence_of :name, :email, :password_digest, message: "Required"
  validates :name, :email, uniqueness: {message: "already Registered"}

 
  def encrypt_password
    self.salt = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(password, salt)
  end


  	def self.authenticate(email="", password="")
		username = email.include?"@"
		
  		if username
    		user = User.find_by_email(email)
  		else
    		user = User.find_by_email(email)
  		end
        if user.present?
        	
          user = user.present? ? user : ""
  			  # if user.password == password
          if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_digest)
    			 return user
  			  else
    			 return false
  			  end
        else
         return false
        end
	  end

end
