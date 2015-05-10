class User < ActiveRecord::Base
  has_secure_password
  #mount_uploader :avatar, AvatarUploader
  validates :username, presence: true
  validates :email, presence: true,
            format: /\A\S+@\S+\z/,
            uniqueness: { case_sensitive: false }

  def self.authenticate(email, password)
  	user = User.find_by(email: email)
  	user && user.authenticate(password)
  end
end
