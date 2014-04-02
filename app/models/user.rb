class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable

  has_many :devotionals
  before_save { self.email = email.downcase }
  before_update :check_password

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness:  { case_sensitive: false }

  validates :password, length: { minimum: 6 },
            presence: true,
            on: :create

  validates :password_confirmation, presence: true,
            on: :create

  mount_uploader :avatar, AvatarUploader

  def full_name
    "#{first_name} #{last_name}"
  end

  private
  def check_password
    is_ok = self.password.nil? || self.password.empty? || self.password.length >= 6

    self.errors[:password] << "Password is too short (minimum is 6 characters)" unless is_ok

    is_ok # The callback returns a Boolean value indicating success; if it fails, the save is blocked
  end

end
