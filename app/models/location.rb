class Location < ActiveRecord::Base

  belongs_to :service
  has_many :user, through: :service

end
