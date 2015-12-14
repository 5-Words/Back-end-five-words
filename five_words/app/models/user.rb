class User < ActiveRecord::Base
	has_many :words
	has_many :images
	has_many :friends
	has_many :messages
	has_secure_password
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
										:bucket => ENV["S3_TEST_BUCKET"]
										:default_url => http://fivewords.s3.amazonaws.com/users/avatars/000/000/002/original/ruby-3b.png?1449877362

  validates_attachment_file_name :avatar, matches: [
    /mp3\Z/, /ogg\Z/, /flac\Z/, /pdf\Z/, /epub\Z/, /djvu\Z/,
    /gif\Z/, /gifv\Z/, /mp4\Z/, /mkv\Z/, /avi\Z/, /webm\Z/,
    /jpg\Z/, /jpeg\Z/, /png\Z/
  ]




	before_validation :ensure_access_token!
	#validates_presence_of :username, :password 
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
