class User < ActiveRecord::Base
	
has_many :schedules
 attr_accessor :password

  validates :email, uniqueness:  true, length: { in: 5..50 } #, format: { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
  validates :password ,presence: true,confirmation: true, length: {  in: 4..20}

 before_save :encrypt_new_password
 def self.authenticate(email, password)
		user = find_by_email(email)
		return user if user && user.authenticated?(password)
	end
	
	def authenticated?(password)
		self.hashed_password == encrypt(password)
	end
 protected
	def encrypt_new_password
		return if password.blank?
		self.hashed_password = encrypt(password)
	end
	def encrypt(string)
		Digest::SHA1.hexdigest(string)
	end

end
