class User < ActiveRecord::Base
  validates(:name, presence: true)
  validates(:email, uniqueness: true,
                    presence: true)
  validates(:password, presence: true,
                       length: { minimum: 5,
                                 message: 'must be at least 5 characters'})
  has_secure_password
  has_and_belongs_to_many :services
end
