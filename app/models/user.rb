class User < ActiveRecord::Base
  include Clearance::User
  has_many :authentications, :dependent => :destroy
  has_many :listings, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  def edit
  end

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.firstname = auth_hash["info"]["first_name"]
      u.lastname = auth_hash["info"]["last_name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.encrypted_password = SecureRandom.urlsafe_base64
      u.remember_token = SecureRandom.urlsafe_base64
      u.authentications<<(authentication)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

end
