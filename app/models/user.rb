class User < ActiveRecord::Base
  has_secure_password
  has_many(:favorites)
  has_many(:services, through: :favorites)
  has_many(:favorites)

  # validates(:email, uniqueness: true, presence: true)
  # # validates(:password, length: { minimum: 5 }, on: :create)
  # validates(:name, presence: true)
  # validates(:admin, inclusion: { in: [true, false] })
  # validates(:balance, numericality: {
  #                           only_integer: true,
  #                           greater_than_or_equal_to: 0 })

end
