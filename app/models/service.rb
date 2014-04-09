class Service < ActiveRecord::Base
    has_and_belongs_to_many :users

  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
  validates :information, presence: true

end
