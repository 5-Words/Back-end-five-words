class User < ActiveRecord::Base
	has_many :words
	has_secure_password
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/




	before_validation :ensure_access_token!
	validates_presence_of :username, :password 
	validates_uniqueness_of :username
	validates_format_of :email, with: /.+@.+\..+/
	validates :access_token, presence: true, uniqueness: true

	def ensure_access_token!
		if self.access_token.blank?
			self.access_token = User.generate_token
		end
	end

	def self.generate_token
		token = SecureRandom.hex
		while User.exists?(access_token: token)
			token = SecureRandom.hex
		end
		token
	end



end
