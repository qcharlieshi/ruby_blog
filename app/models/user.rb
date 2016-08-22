class User < ActiveRecord::Base
  has_many :articles
  before_save {self.email = email.downcase}

  validates :username,
            prescence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 3, maximum: 25}

  VALID_MEIAL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            prescence: true,
            length: {minimum: 3, maximum: 105},
            uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX}

end