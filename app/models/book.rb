class Book < ApplicationRecord
	has_many :likes
	
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "Missing Photo"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
