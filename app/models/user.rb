class User < ActiveRecord::Base
  has_secure_password
  has_many(:favorites)
  has_and_belongs_to_many :services

end

  # validates(:email, uniqueness: true, presence: true)
  # # validates(:password, length: { minimum: 5 }, on: :create)
  # validates(:name, presence: true)

