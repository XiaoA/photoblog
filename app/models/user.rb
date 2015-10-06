class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :name
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
end
