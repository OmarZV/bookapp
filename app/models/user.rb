class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]
         
	
	has_many :likes
	has_many :events
	has_many :notifications, foreign_key: :recipient_id
	has_many :chatroom_users
	has_many :chatrooms, through: :chatroom_users
	has_many :messages
	has_one :ranking
	
	
         
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "Missing Photo"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  
  
  
   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name     
      user.avatar = URI.parse(auth.info.image)
    end
  end

	def likes?(post)
		post.likes.where(user_id: id).any?
	end	
end



	 