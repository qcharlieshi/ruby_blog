class User < ActiveRecord::Base
  has_many :articles
  before_save {self.email = email.downcase}
  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :username,
            presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 3, maximum: 25}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            presence: true,
            length: {minimum: 3, maximum: 105},
            uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX}

  has_secure_password
end