class Book < ApplicationRecord
	has_many :likes
	
	has_attached_file :avatar, 
	s3_credentials: {
    :bucket => ENV.fetch('AWS_BUCKET'),
    :access_key_id => ENV.fetch('AWS_ACCESS_KEY_ID'),
    :secret_access_key => ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    :s3_region => ENV.fetch('AWS_REGION'),
  }, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "Missing Photo"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
