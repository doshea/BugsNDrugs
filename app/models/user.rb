# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  email                  :string(255)
#  username               :string(255)
#  is_admin               :boolean
#  password_digest        :string(255)
#  image                  :text
#  auth_token             :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  password_reset_token   :string
#  password_reset_sent_at :datetime
#  verified               :boolean          default("false")
#  verification_token     :string
#

class User < ActiveRecord::Base
  has_secure_password
  
  mount_uploader :image, AccountPicUploader
  
  before_create { generate_token(:auth_token); generate_token(:verification_token); }

  MIN_PASSWORD_LENGTH = 5
  MAX_PASSWORD_LENGTH = 16
  validates :password,
    presence: true,
    confirmation: true,
    length: { minimum: MIN_PASSWORD_LENGTH, maximum: MAX_PASSWORD_LENGTH, message: ": Should be #{MIN_PASSWORD_LENGTH}-#{MAX_PASSWORD_LENGTH} characters" },
    on: :create

  validates :password,
    confirmation: true,
    length: { minimum: MIN_PASSWORD_LENGTH, maximum: MAX_PASSWORD_LENGTH, message: ": Should be #{MIN_PASSWORD_LENGTH}-#{MAX_PASSWORD_LENGTH} characters" },
    allow_blank: true,
    on: :update

  MAX_EMAIL_LENGTH = 35
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    presence: true,
    uniqueness: true,
    length: { maximum: MAX_EMAIL_LENGTH, message: ": That's just too long. Your email shouldn't be above #{MAX_EMAIL_LENGTH} characters" },
    format: { with: VALID_EMAIL_REGEX, message: ": Only real email addresses, please" }

  MAX_USERNAME_LENGTH = 16
  MIN_USERNAME_LENGTH = 4
  validates :username,
    presence: true,
    uniqueness: true,
    length: { minimum: MIN_USERNAME_LENGTH, maximum: MAX_USERNAME_LENGTH, message: ": Should be #{MIN_USERNAME_LENGTH}-#{MAX_USERNAME_LENGTH} characters"}

  MIN_NAME_LENGTH = 2
  MAX_FIRST_NAME_LENGTH = 18 #hard-coded in database
  MAX_LAST_NAME_LENGTH = 24 #hard-coded in database
  validates :first_name,
    allow_blank: true,
    length: { minimum: MIN_NAME_LENGTH, maximum: MAX_FIRST_NAME_LENGTH, message: ": Should be at least #{MIN_NAME_LENGTH} characters"}
  validates :last_name,
    allow_blank: true,
    length: { minimum: MIN_NAME_LENGTH, maximum: MAX_LAST_NAME_LENGTH, message: ": Should be at least #{MIN_NAME_LENGTH} characters"}

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column]) #may need a colon
  end
  def full_name
    "#{first_name} #{last_name}".strip
  end
  def display_first_name
    first_name.present? ? first_name : username
  end
  def named_email_address
    full_name.blank? ? email : "#{full_name} <#{email}>"
  end
end
