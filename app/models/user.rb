class User < ApplicationRecord

  has_many :galleries
  has_many :images

  has_secure_password

  validates :username, :email, presence:    true,
                               allow_blank: false,
                               uniqueness:  true

end
