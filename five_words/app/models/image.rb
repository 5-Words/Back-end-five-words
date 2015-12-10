class Image < ActiveRecord::Base
	belongs to :user
	has_attached_file :image, syles: {medium: "300x300>", thumb: "100x100>"}
	validates_attachment_file_name :avatar, matches: [ 
		/png\Z/, /jpg\Z/, /jpeg\Z/, /gif\Z/, /gifv\Z/ ]
end
