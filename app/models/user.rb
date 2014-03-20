class User < ActiveRecord::Base
  has_many :devotionals
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness:  { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }

  mount_uploader :avatar, AvatarUploader

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def create_remember_token
    self.remember_token = User.hash(User.new_remember_token)
  end



end
